package com.example.commerce.controller.blog;

import com.example.commerce.model.dto.CommentBlogDTO;
import com.example.commerce.service.*;
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
    private final CouponService couponService;
    private final CategoriesService categoriesService;

    @GetMapping("/blog")
    public String blog(Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("cate", categoriesService.getAll().stream().limit(5).toList());
        return blogService.getBlogForBlogPage(model, request);
    }

    @GetMapping("/blog-detail")
    public String blogDetail(@RequestParam(name = "id") Long id, Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("userService", userService);
        model.addAttribute("cate", categoriesService.getAll().stream().limit(5).toList());
        return blogService.blogDetail(id, model, request);
    }

    @PostMapping("/blog-detail/review")
    public String commentBlog(@ModelAttribute CommentBlogDTO commentBlogDTO, Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        commentBlogService.add(commentBlogDTO, model);
        model.addAttribute("cate", categoriesService.getAll().stream().limit(5).toList());
        return "redirect:/blog-detail?id=" + commentBlogDTO.getBlogId();
    }
}
