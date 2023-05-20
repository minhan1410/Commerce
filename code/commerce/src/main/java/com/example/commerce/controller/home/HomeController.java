package com.example.commerce.controller.home;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoriesService categoriesService;
    private final CouponService couponService;

    @GetMapping(value = {"/", "/home"})
    public String home(Model model, HttpServletRequest request) {
        List<ProductDTO> products = productService.getAllDistinctName();
        products.forEach(productDTO -> productDTO.setCategories(categoriesService.getById(productDTO.getCategoriesId())));
        productService.getAllProductForProductPage(model, request);
        couponService.getByDiscountMax(model);
        model.addAttribute("cate", categoriesService.getAll());
        model.addAttribute("products", products);
        return "index";
    }

    @PostMapping(value = "/search")
    public String search(Model model, @RequestParam(name = "name", defaultValue = "") String name) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("products", productService.searchProduct(name));
        model.addAttribute("categoriesService", categoriesService);
        return "index";
    }
}
