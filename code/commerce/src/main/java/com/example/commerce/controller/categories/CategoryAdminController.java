package com.example.commerce.controller.categories;

import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.service.CategoriesService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller()
@RequestMapping("/admin/categories")
@RequiredArgsConstructor
public class CategoryAdminController {
    private final CategoriesService categoriesService;

    @GetMapping()
    public String listCategories(Model model) {
        model.addAttribute("categories", categoriesService.getAll());
        return "/admin/viewCategory";
    }

    @GetMapping("/add")
    public String addCategories(Model model) {
        model.addAttribute("category", new CategoriesDTO());
        return "/admin/addCategories";
    }

    @PostMapping("/add")
    public String addCategoriesNew(@ModelAttribute("category") CategoriesDTO dto, Model model) {
        return categoriesService.add(dto, model);
    }

    @GetMapping("/update/{id}")
    public String editCateGet(@PathVariable(name = "id") Long id, Model model) {
        model.addAttribute("categories", categoriesService.getById(id, model));
        return "/admin/editCategories";
    }

    @PostMapping("/update")
    public String editCatePost(@ModelAttribute(name = "categories") CategoriesDTO dto, Model model) {
        return categoriesService.update(dto, model);
    }

    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model) {
        return categoriesService.delete(id, model);
    }
}
