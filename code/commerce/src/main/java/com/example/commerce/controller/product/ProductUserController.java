package com.example.commerce.controller.product;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class ProductUserController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoriesService categoriesService;
    private final ReviewService reviewService;
    private final CouponService couponService;

    @GetMapping("/product-detail")
    public String getProductById(Model model, @RequestParam(name = "id", required = false) Long id) {
        ProductDTO product = productService.productDetail(id, model);
        if (product == null) {
            return "/error/notFound";
        }
        couponService.getByExpirationDate(model);
        model.addAttribute("categoriesService", categoriesService);
        model.addAttribute("numberOfReview", reviewService.countProduct(id));
        model.addAttribute("reviews", reviewService.getByProductId(id));
        model.addAttribute("type", categoriesService.getById(product.getCategoriesId()).getType());
        return "product-detail";
    }

    @PostMapping(value = "/member/product-detail/review")
    public String review(@ModelAttribute ReviewDTO dto, Model model) {
        return reviewService.add(dto);
    }

    @GetMapping(value = "/product")
    public String getAllProductForProductPage(Model model, HttpServletRequest request) {
        couponService.getByExpirationDate(model);
        model.addAttribute("cate", categoriesService.getAll());
        model.addAttribute("categoriesService", categoriesService);
        return productService.getAllProductForProductPage(model, request);
    }
}
