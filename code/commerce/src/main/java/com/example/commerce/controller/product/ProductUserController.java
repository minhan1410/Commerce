package com.example.commerce.controller.product;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class ProductUserController {
    private static final Map<String, List<ReviewDTO>> map = new HashMap<>();
    private final ProductService productService;
    private final CategoriesService categoriesService;
    private final ReviewService reviewService;
    private final CouponService couponService;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final BillRepository billRepository;

    @GetMapping("/product-detail")
    public String getProductById(Model model, @RequestParam(name = "id", required = false) Long id) {
        ProductDTO product = productService.productDetail(id, model);
        if (product == null) {
            return "/error/notFound";
        }
        product.setCategories(categoriesService.getById(product.getCategoriesId()));
        model.addAttribute("product", product);
        couponService.getByDiscountMax(model);

        List<ReviewDTO> reviews = reviewService.getByProductIds(productService.getRelatedByName(product.getName()).stream().map(ProductDTO::getId).toList());
        model.addAttribute("reviews", reviews);

        map.computeIfAbsent(product.getName(), k -> new ArrayList<>());
        if (reviews.size() > map.get(product.getName()).size()) {
            map.put(product.getName(), reviews);
        }

        List<ProductDTO> related = productService.getAllDistinctName().stream().filter(p -> p.getCategoriesId().equals(product.getCategoriesId()))
                .filter(p -> !p.getName().equals(product.getName())).toList();
        related.forEach(productDTO -> productDTO.setCategories(categoriesService.getById(productDTO.getCategoriesId())));
        model.addAttribute("related", related);
        model.addAttribute("isOrder", billRepository.hasCartItems((Long) model.getAttribute("id"), id));
        return "product-detail";
    }

    //    @PostMapping(value = "/member/product-detail/review")
    @MessageMapping("/save-review")
    public void review(@ModelAttribute ReviewDTO dto) {
        reviewService.add(dto);
        List<ReviewDTO> reviews = new ArrayList<>(map.get(dto.getProduct().getName()));
        reviews.add(dto);
        map.put(dto.getProduct().getName(), reviews);
        String destination = String.format("/review/product/%s", productService.getById(dto.getProductId()).getName());
        simpMessagingTemplate.convertAndSend(destination, reviews);
    }

    @GetMapping(value = "/product")
    public String getAllProductForProductPage(Model model, HttpServletRequest request) {
        couponService.getByDiscountMax(model);
        model.addAttribute("cate", categoriesService.getAll());
        model.addAttribute("categoriesService", categoriesService);
        return productService.getAllProductForProductPage(model, request);
    }
}
