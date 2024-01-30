package com.example.commerce.controller.blog;

import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.dto.BlogTagDTO;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller()
@RequestMapping("/admin/blog")
@RequiredArgsConstructor
public class BlogAdminController {
    private final BlogService blogService;
    private final CategoriesBlogService categoryBlogService;
    private final CategoriesBlogService categoriesBlogService;
    private final TagService tagService;
    private final BlogTagService blogTagService;
    private final UserService userService;
    private final NotificationService notificationService;

    @GetMapping()
    public String listBlog(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("blogs", blogService.getAll());
        model.addAttribute("categoryForBlog", categoryBlogService);
        return "/admin/blog/list-blog";
    }

    @GetMapping("/new")
    public String newBlog(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("listTags", tagService.getAll());
        model.addAttribute("blog", new BlogDTO());
        model.addAttribute("categoryForBlog", categoriesBlogService.getAll());
        return "/admin/blog/add-blog";
    }

    @PostMapping("/new")
    public String saveNewBlog(@ModelAttribute(name = "blog") BlogDTO blogDTO, @RequestParam(value = "tagId") List<Long> tagId, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        return blogService.add(blogDTO, tagId, model);
    }

    @GetMapping("/edit")
    public String editBlog(Model model, Long id) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        BlogDTO byId = blogService.getById(id, model);
        if (byId == null) return "error/notFound";
        model.addAttribute("listTags", tagService.getAll());
        model.addAttribute("blog", byId);
        model.addAttribute("categoryForBlog", categoriesBlogService.getAll());
        model.addAttribute("tags", blogTagService.getByBlogId(id).stream().map(BlogTagDTO::getTagId).toList());
        return "/admin/blog/edit-blog";
    }

    @PostMapping("/edit")
    public String editBlogSave(@ModelAttribute("blog") BlogDTO blogDTO, @RequestParam(value = "tagId") List<Long> tagId, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        return blogService.update(blogDTO, tagId, model);
    }

    @GetMapping("/delete/{id}")
    public String deleteBlog(@PathVariable(name = "id") Long id, Model model) throws IOException {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        blogService.delete(id, model);
        return "redirect:/admin/blog";
    }
}
