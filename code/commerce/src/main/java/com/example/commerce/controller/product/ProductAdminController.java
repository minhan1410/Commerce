package com.example.commerce.controller.product;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
@RequestMapping("/admin/product")
@RequiredArgsConstructor
public class ProductAdminController {
    private final ProductService productService;
    private final CategoriesService categoriesService;
    private final ReviewService reviewService;

    @GetMapping()
    public String listProduct(Model model) {
        model.addAttribute("products", productService.getAll());
        model.addAttribute("categoriesService", categoriesService);
//        model.addAttribute("listCategories", categoriesService.getAll());
        return "/admin/viewProduct";
    }

    @GetMapping("/add")
    public String addProduct(Model model) {
        model.addAttribute("product", new ProductDTO());
        model.addAttribute("listCategories", categoriesService.getAll());
        return "/admin/addProduct";
    }

    @PostMapping("/add")
    public String addProductNew(@Valid @ModelAttribute("product") ProductDTO dto, BindingResult result, Model model) {
        model.addAttribute("listCategories", categoriesService.getAll());
        return result.hasErrors() ? "/admin/addProduct" : productService.add(dto, model);
    }

    @GetMapping("/update/{id}")
    public String update(@PathVariable(name = "id") Long id, Model model) {
        ProductDTO getId = productService.getById(id, model);
        if (getId == null) {
            return "/error/notFound";
        }
        model.addAttribute("product", getId);
        model.addAttribute("listCategories", categoriesService.getAll());
        return "/admin/editProduct";
    }

    @PostMapping("/update")
    public String updatePost(@Valid @ModelAttribute("product") ProductDTO dto, BindingResult result, Model model) {
        return result.hasErrors() ? "/admin/editProduct" : productService.update(dto, model);
    }

    @GetMapping("/duplicate/{id}")
    public String duplicate(@PathVariable(name = "id") Long id, Model model) {
        ProductDTO getId = productService.getById(id, model);
        if (getId == null) {
            return "/error/notFound";
        }
        model.addAttribute("product", getId);
        model.addAttribute("listCategories", categoriesService.getAll());
        return "/admin/duplicateProduct";
    }

    @PostMapping("/duplicate")
    public String duplicatePost(@ModelAttribute("product") ProductDTO dto, Model model) {
        return productService.duplicate(dto, model);
    }

    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id, Model model) {
        reviewService.deleteByProduct(id);
        return productService.delete(id, model);
    }
}
