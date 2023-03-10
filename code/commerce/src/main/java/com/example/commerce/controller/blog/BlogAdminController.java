package com.example.commerce.controller.blog;

import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.dto.BlogTagDTO;
import com.example.commerce.service.BlogService;
import com.example.commerce.service.BlogTagService;
import com.example.commerce.service.CategoriesBlogService;
import com.example.commerce.service.TagService;
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

    @GetMapping()
    public String listBlog(Model model) {
        model.addAttribute("blogs", blogService.getAll());
        model.addAttribute("categoryForBlog", categoryBlogService);
        return "/admin/viewBlog";
    }

    @GetMapping("/new")
    public String newBlog(Model model) {
        model.addAttribute("listTags", tagService.getAll());
        model.addAttribute("blog", new BlogDTO());
        model.addAttribute("categoryForBlog", categoriesBlogService.getAll());
        return "/admin/addBlog";
    }

    @PostMapping("/new")
    public String saveNewBlog(@ModelAttribute(name = "blog") BlogDTO blogDTO, @RequestParam(value = "tagId") List<Long> tagId, Model model) {
        return blogService.add(blogDTO, tagId, model);
    }

    @GetMapping("/edit")
    public String editBlog(Model model, Long id) {
        BlogDTO byId = blogService.getById(id, model);
        if (byId == null) return "error/notFound";
        model.addAttribute("listTags", tagService.getAll());
        model.addAttribute("blog", byId);
        model.addAttribute("categoryForBlog", categoriesBlogService.getAll());
        model.addAttribute("tags", blogTagService.getByBlogId(id).stream().map(BlogTagDTO::getTagId).toList());
        return "/admin/editBlog";
    }

    @PostMapping("/edit")
    public String editBlogSave(@ModelAttribute("blog") BlogDTO blogDTO, @RequestParam(value = "tagId") List<Long> tagId, Model model) {
        return blogService.update(blogDTO, tagId, model);
    }

    @GetMapping("/delete/{id}")
    public String deleteBlog(@PathVariable(name = "id") Long id, Model model) throws IOException {
        blogService.delete(id, model);
        return "redirect:/admin/blog";
    }
}
