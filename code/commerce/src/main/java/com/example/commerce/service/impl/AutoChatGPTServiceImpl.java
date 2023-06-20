package com.example.commerce.service.impl;

import com.example.commerce.service.AutoChatGPTService;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

@Service
@Slf4j
public class AutoChatGPTServiceImpl implements AutoChatGPTService {
    private static JSONArray cachedTrainData;
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
        OkHttpClient client = new OkHttpClient.Builder().readTimeout(2, TimeUnit.MINUTES).build(); // Thiết lập timeout 2 phút

        // Tạo dữ liệu yêu cầu
        JSONObject requestObject = new JSONObject();
        requestObject.put("model", "gpt-3.5-turbo");

        JSONArray messagesJson = cachedTrainData;
        messagesJson.put(AutoChatGPTService.createMessage("user", message));
        requestObject.put("messages", messagesJson);

        // Tạo request body
        RequestBody requestBody = RequestBody.create(
                okhttp3.MediaType.parse("application/json"), requestObject.toString());

        // Tạo header
        Headers headers = new Headers.Builder()
                .add("Content-Type", "application/json")
                .add("Authorization", "Bearer " + apiKey)
                .build();

        // Tạo yêu cầu POST
        Request request = new Request.Builder()
                .url("https://api.openai.com/v1/chat/completions")
                .headers(headers)
                .post(requestBody)
                .build();

        // Gửi yêu cầu và nhận phản hồi
        Response response = client.newCall(request).execute();

        if (response.isSuccessful()) {
            return response.body().string();
        }
        return "Request failed: " + response.code();
    }
}
