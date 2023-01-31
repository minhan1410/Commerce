package com.example.commerce.controller.home;

import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class HomeController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoriesService categoriesService;

    @GetMapping(value = {"/", "/home"})
    public String home(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("products", productService.getAllDistinctName());
        model.addAttribute("categoriesService", categoriesService);
        return "index";
    }

    @PostMapping(value = "/search")
    public String search(Model model, @RequestParam(name = "name", defaultValue = "") String name) {
        userService.getCurrentUser(model);
        model.addAttribute("products", productService.searchProduct(name));
        model.addAttribute("categoriesService", categoriesService);
        return "index";
    }
}
