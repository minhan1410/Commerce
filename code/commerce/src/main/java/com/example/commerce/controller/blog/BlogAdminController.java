package com.example.commerce.controller.blog;

import com.example.commerce.service.BlogService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller()
@RequestMapping("/admin/blog")
@RequiredArgsConstructor
public class BlogAdminController {
    private final BlogService blogService;

    @GetMapping()
    public String listBlog(Model model) {
        model.addAttribute("blogs", blogService.getAll());
        model.addAttribute("categoryForBlog", null);

        return "/admin/viewBlog";
    }
}
