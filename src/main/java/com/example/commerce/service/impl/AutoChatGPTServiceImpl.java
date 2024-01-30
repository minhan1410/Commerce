package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.service.AutoChatGPTService;
import com.example.commerce.service.BillService;
import com.example.commerce.service.ProductService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

@Service
@Slf4j
@RequiredArgsConstructor
public class AutoChatGPTServiceImpl implements AutoChatGPTService {
    private static JSONArray cachedTrainData;
    private final ProductService productService;
    private final BillService billService;
    private final CacheStore<String, String> autoChatGPTCache;
    @Value("${openai.api.key}")
    private String apiKey;
    @Value("${path.file.train}")
    private String pathFile;

    @PostConstruct
    public void init() {
        if (cachedTrainData == null) {
            try {
                FileInputStream fis = new FileInputStream(pathFile);

                // Đọc dữ liệu từ file JSON
                ObjectMapper objectMapper = new ObjectMapper();
                JsonNode rootNode = objectMapper.readTree(fis);

                // Convert dữ liệu thành JSONArray
                JSONArray jsonArray = new JSONArray();
                for (JsonNode node : rootNode) {
                    jsonArray.put(AutoChatGPTService.createMessage(node.get("role").asText(), node.get("content").asText()));
                }
                cachedTrainData = jsonArray;

                log.info("Import train data successfully");
            } catch (IOException e) {
                log.error("Import train data failed");
                e.printStackTrace();
            }
        }
    }


    @Override
    public String chat(String message) throws IOException {
//        Check trong cache
        if (autoChatGPTCache.getCache().asMap().containsKey(message)) {
            return autoChatGPTCache.getCache().getIfPresent(message);
        }

//        Check xem trong message có chưa tên sản phẩm không?
        List<ProductDTO> productDTOS = containsProductName(message);
        boolean checkProduct = productDTOS.size() > 1;
        boolean productExist = productDTOS.size() == 1 && containsQuantity(message);

        JSONObject requestObject = requestObject();
        JSONArray messagesJson = messagesJson(productExist, message);
        String result = null;

        if (containsSelling(message)) {
            StringBuilder mess = new StringBuilder("Chúng tôi sẽ cung cấp cho bạn top 5 sản phẩm bán chạy nhất: ");
            billService.getAll().stream().map(BillDTO::getCartItem).flatMap(List::stream)
                    .collect(Collectors.groupingBy(cartItemDTO -> cartItemDTO.getProduct(), Collectors.summingInt(CartItemDTO::getQuantity)))
                    .entrySet().stream().sorted(Map.Entry.comparingByValue(Comparator.reverseOrder())).limit(5)
                    .forEach(entry -> mess.append(String.format("%s: %d, ", entry.getKey().getName(), entry.getValue())));
            result = mess.toString();
            autoChatGPTCache.getCache().put(message, result);
            return result;
        }

        if (checkProduct) {
            result = "Nhập đầy đủ tên của sản phẩm";
            autoChatGPTCache.getCache().put(message, result);
            return result;
        }

        if (productExist) {
            ProductDTO product = productDTOS.get(0);
            StringBuilder mess = new StringBuilder(String.format("Sản phẩm %s($%d): ", product.getName(), product.getPrice()));
            productService.getRelatedByName(product.getName()).forEach(p -> mess.append(String.format(" size %s color %s còn lại %d sản phẩm,", p.getSize(), p.getColor(), p.getQuantity())));
            result = mess.toString();
            autoChatGPTCache.getCache().put(message, result);
            return result;
        }

        // Tạo request body
        requestObject.put("messages", messagesJson);
        RequestBody requestBody = createRequestBody(requestObject);
        // Tạo yêu cầu POST
        Request request = createRequest(requestBody);

//        Gửi request đến api
        OkHttpClient client = new OkHttpClient.Builder().readTimeout(3, TimeUnit.MINUTES).build(); // Thiết lập timeout 3 phút

        // Gửi yêu cầu và nhận phản hồi
        Response response = client.newCall(request).execute();
        if (response.isSuccessful()) {
            String body = response.body().string();
            JsonObject jsonObject = new Gson().fromJson(body, JsonObject.class);
            result = jsonObject.get("choices").getAsJsonArray().get(0).getAsJsonObject().getAsJsonObject("message").get("content").getAsString();
            autoChatGPTCache.getCache().put(message, result);
            return result;
        }

        return "The system is overloaded. Please try again later.";
    }

    private List<ProductDTO> containsProductName(String message) {
        List<ProductDTO> distinctName = productService.getAllDistinctName();
        return distinctName.stream().filter(p -> message.toLowerCase().contains(p.getName().toLowerCase())).toList();
    }

    private boolean containsKey(String question, String[] keys) {
        return Arrays.stream(keys).anyMatch(k -> question.toLowerCase().contains(k.toLowerCase()));
    }

    private boolean containsQuantity(String question) {
        String[] quantityKeywords = {"còn lại", "số lượng", "bao nhiêu", "how many", "remaining", "quantity", "còn hàng", "hết hàng", "hàng còn", "tồn kho", "tồn đọng", "sản phẩm có sẵn", "available", "in stock", "stock", "product count", "product availability"};
        return containsKey(question, quantityKeywords);
    }

    private boolean containsSelling(String question) {
        String[] keys = {"bán chạy", "phổ biến", "hàng nổi bật", "best-selling", "popular", "top bán chạy", "hot item"};
        return containsKey(question, keys);
    }

    private RequestBody createRequestBody(JSONObject requestObject) {
        return RequestBody.create(okhttp3.MediaType.parse("application/json"), requestObject.toString());
    }

    private Request createRequest(RequestBody requestBody) {
        // Tạo header
        Headers headers = new Headers.Builder().add("Content-Type", "application/json").add("Authorization", "Bearer " + apiKey).build();

        return new Request.Builder().url("https://api.openai.com/v1/chat/completions").headers(headers).post(requestBody).build();
    }

    private JSONObject requestObject() {
        return new JSONObject().put("model", "gpt-3.5-turbo");
    }

    private JSONArray messagesJson(boolean productExist, String message) {
        JSONArray messagesJson = new JSONArray();
        messagesJson.put(AutoChatGPTService.createMessage("system", "Hãy đóng vai làm nhân viên tư vấn cho website bán hàng thời trang và anh Minh An chủ shop và là người thuê bạn làm việc"));
        if (!productExist) messagesJson.putAll(cachedTrainData);
        messagesJson.put(AutoChatGPTService.createMessage("user", message));
        return messagesJson;
    }
}
