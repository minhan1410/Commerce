package com.example.commerce.controller.blog;

import com.example.commerce.service.BlogService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class BlogUserController {
    private final BlogService blogService;
    private final UserService userService;

    @GetMapping("/blog")
    public String blog(Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);
        blogService.getBlogForBlogPage(model, request);
        return "blog";
    }
}
