package com.example.commerce.controller.product;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.ReviewService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class ProductUserController {
    private final UserService userService;
    private final ProductService productService;
    private final CategoriesService categoriesService;
    private final ReviewService reviewService;

    @GetMapping("/product-detail")
    public String getProductById(Model model, @RequestParam(name = "id", required = false) Long id) {
        userService.getCurrentUser(model);
        ProductDTO product = productService.getById(id, model);
        List<ProductDTO> related = productService.getAllDistinctName().stream()
                .filter(p -> !p.getName().equals(product.getName())).toList();
        List<ProductDTO> sizes = productService.getSizesByColor(product.getName(), product.getColor());
        List<ProductDTO> colors = productService.getAllDistinctColor(product.getName(), product.getColor());
        model.addAttribute("categoriesService", categoriesService);
        model.addAttribute("numberOfReview", reviewService.countProduct(id));
        model.addAttribute("reviews", reviewService.getByProductId(id, model));
        model.addAttribute("userService", userService);
        model.addAttribute("product", product);
        model.addAttribute("sizes", sizes);
        model.addAttribute("colors", colors);
        model.addAttribute("related", related);
        model.addAttribute("type", categoriesService.getById(product.getCategoriesId()).getType());
        return "product-detail";
    }

    @PostMapping(value = "/member/product-detail/review")
    public String review(@ModelAttribute ReviewDTO dto, Model model) {
        userService.getCurrentUser(model);
        return reviewService.add(dto, model);
    }
}
