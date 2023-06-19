package com.example.commerce.controller.categories;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.service.*;
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
    private final UserService userService;
    private final NotificationService notificationService;

    @GetMapping("categories")
    public String listCategories(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categories", categoriesService.getAll());
        return "/admin/category/list-category";
    }


    @GetMapping("/categories/new")
    public String addCategories(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("category", new CategoriesDTO());
        return "/admin/addCategories";
    }

    @PostMapping("categories/new")
    public String addCategoriesNew(@ModelAttribute("category") CategoriesDTO dto, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categories", categoriesService.getAll());
        return categoriesService.add(dto, model);
    }

    @GetMapping("categories/update/{id}")
    public String editCateGet(@PathVariable(name = "id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categories", categoriesService.getById(id, model));
        return "/admin/editCategories";
    }

    @PostMapping("categories/update")
    public String editCatePost(@RequestParam("type") String type, @RequestParam("id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categories", categoriesService.getAll());
        return categoriesService.update(CategoriesDTO.builder().id(id).type(type).deleted(false).build(), model);
    }

    @GetMapping("categories/delete/{id}")
    public String deleteCategory(@PathVariable("id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        return categoriesService.delete(id, model);
    }

    //
    @GetMapping("categories-blog")
    public String listCategoriesBlog(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categoriesForBlog", categoriesBlogService.getAll());
        return "/admin/category/list-categoryBlog";
    }

    @GetMapping("/categoriesforblog/new")
    public String addCategoriesForBlog(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("category", new CategoriesBlogDTO());
        return "/admin/addCategoriesForBlog";
    }

    @PostMapping("/categoriesforblog/save")
    public String addCategoriesForBlogNew(@ModelAttribute("category") CategoriesBlogDTO categoriesBlogDTO, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categoriesForBlog", categoriesBlogService.getAll());
        return categoriesBlogService.add(categoriesBlogDTO, model);
    }

    @GetMapping("/categoriesforblog/update")
    public String editCategoriesForBlog(Model model, Long id) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categoriesForBlogDTO", categoriesBlogService.getById(id, model));
        return "/admin/editCategoriesForBlog";
    }

    @PostMapping("/categoriesforblog/update")
    public String editCategoriesForBlogSave(@RequestParam("type") String type, @RequestParam("id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("categoriesForBlog", categoriesBlogService.getAll());
        return categoriesBlogService.update(CategoriesBlogDTO.builder().id(id).type(type).deleted(false).build(), model);
    }

    @GetMapping("/categoriesforblog/delete/{id}")
    public String deleteCategoriesBlog(@PathVariable(name = "id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        categoriesBlogService.delete(id, model);
        //          delete all blog
        blogService.delete(blogService.getCategoryBlogId(id), model);
        return "redirect:/admin/categories-blog";
    }

}
