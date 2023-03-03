package com.example.commerce.controller.categories;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.service.BlogService;
import com.example.commerce.service.CategoriesBlogService;
import com.example.commerce.service.CategoriesService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller()
@RequestMapping("/admin")
@RequiredArgsConstructor
public class CategoryAdminController {
    private final CategoriesService categoriesService;
    private final CategoriesBlogService categoriesBlogService;
    private final BlogService blogService;

    @GetMapping("categories")
    public String listCategories(Model model) {
        model.addAttribute("categories", categoriesService.getAll());
        model.addAttribute("categoriesForBlog", categoriesBlogService.getAll());
        return "/admin/viewCategory";
    }

//

    @GetMapping("/categories/new")
    public String addCategories(Model model) {
        model.addAttribute("category", new CategoriesDTO());
        return "/admin/addCategories";
    }

    @PostMapping("categories/new")
    public String addCategoriesNew(@ModelAttribute("category") CategoriesDTO dto, Model model) {
        return categoriesService.add(dto, model);
    }

    @GetMapping("categories/update/{id}")
    public String editCateGet(@PathVariable(name = "id") Long id, Model model) {
        model.addAttribute("categories", categoriesService.getById(id, model));
        return "/admin/editCategories";
    }

    @PostMapping("categories/update")
    public String editCatePost(@ModelAttribute(name = "categories") CategoriesDTO dto, Model model) {
        return categoriesService.update(dto, model);
    }

    @GetMapping("categories/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model) {
        return categoriesService.delete(id, model);
    }

//

    @GetMapping("/categoriesforblog/new")
    public String addCategoriesForBlog(Model model) {
        model.addAttribute("category", new CategoriesBlogDTO());
        return "/admin/addCategoriesForBlog";
    }

    @PostMapping("/categoriesforblog/save")
    public String addCategoriesForBlogNew(@ModelAttribute("category") CategoriesBlogDTO categoriesBlogDTO, Model model) {
        return categoriesBlogService.add(categoriesBlogDTO, model);
    }

    @GetMapping("/categoriesforblog/update")
    public String editCategoriesForBlog(Model model, Long id) {
        model.addAttribute("categoriesForBlogDTO", categoriesBlogService.getById(id, model));
        return "/admin/editCategoriesForBlog";
    }

    @PostMapping("/categoriesforblog/update")
    public String editCategoriesForBlogSave(@ModelAttribute("categoriesForBlogDTO") CategoriesBlogDTO categoriesBlogDTO, Model model) {
        return categoriesBlogService.update(categoriesBlogDTO, model);
    }

    @GetMapping("/categoriesforblog/delete/{id}")
    public String deleteCategoriesBlog(@PathVariable(name = "id") Long id, Model model) {
        categoriesBlogService.delete(id, model);
        //          delete all blog
        blogService.delete(blogService.getCategoryBlogId(id), model);
        return "redirect:/admin/categories";
    }

}
