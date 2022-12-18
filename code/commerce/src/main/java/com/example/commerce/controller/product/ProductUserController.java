package com.example.commerce.controller.product;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ProductUserController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoriesService categoriesService;

    @GetMapping("/product-detail")
    public String getProductById(Model model, @RequestParam(name = "id", required = false) Long id) {
        userService.getCurrentUser(model);
        ProductDTO product = productService.getById(id, model);

//        long numberOfReview = reviewDao.countById(id);
        model.addAttribute("numberOfReview", 0);
        model.addAttribute("reviews", null);
//        model.addAttribute("reviews", reviewService.find(id));
        model.addAttribute("product", product);
        model.addAttribute("type", categoriesService.getById(product.getCategoriesId()).getType());
        return "product-detail";
    }
}
