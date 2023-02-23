package com.example.commerce.controller.blog;

import com.example.commerce.model.dto.CommentBlogDTO;
import com.example.commerce.service.BlogService;
import com.example.commerce.service.CommentBlogService;
import com.example.commerce.service.UserService;
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
public class BlogUserController {
    private final BlogService blogService;
    private final UserService userService;
    private final CommentBlogService commentBlogService;

    @GetMapping("/blog")
    public String blog(Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);
        blogService.getBlogForBlogPage(model, request);
        return "blog";
    }

    @GetMapping("/blog-detail")
    public String blogDetail(@RequestParam(name = "id") Long id, Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);
        blogService.blogDetail(id, model, request);
        model.addAttribute("userService", userService);
        return "blog-detail";
    }

    @PostMapping("/blog-detail/review")
    public String commentBlog(@ModelAttribute CommentBlogDTO commentBlogDTO, Model model) {
        userService.getCurrentUser(model);
        commentBlogService.add(commentBlogDTO, model);
        return "redirect:/blog-detail?id=" + commentBlogDTO.getBlogId();
    }
}
