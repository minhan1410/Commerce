package com.example.commerce.controller.review;

import com.example.commerce.model.dto.*;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/review")
@RequiredArgsConstructor
public class ReviewAdminController {
    private final ReviewService reviewService;
    private final ProductService productService;
    private final UserService userService;
    private final CommentBlogService commentBlogService;
    private final BlogService blogService;
    private final NotificationService notificationService;

    @GetMapping()
    public String getComment(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        List<ReviewDTO> getAll = reviewService.getAll();
        Map<Long, ProductDTO> productsMap = getAll.stream().map(ReviewDTO::getProductId).distinct().collect(Collectors
                .toMap(Long::longValue, productId -> productService.getById(productId)));
        Map<Long, UserDTO> usersMap = getAll.stream().map(ReviewDTO::getReviewerId).distinct().collect(Collectors
                .toMap(Long::longValue, reviewerId -> userService.getById(reviewerId)));

        model.addAttribute("reviews", getAll);
        model.addAttribute("productsMap", productsMap);
        model.addAttribute("usersMap", usersMap);
        return "/admin/review/list-review";
    }

    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable(name = "id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        reviewService.delete(id);
        return "redirect:/admin/review";
    }

    @GetMapping("/blog")
    public String getCommentBlog(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        List<CommentBlogDTO> getAll = commentBlogService.getAll();
        Map<Long, BlogDTO> blogsMap = getAll.stream().map(CommentBlogDTO::getBlogId).distinct().collect(Collectors
                .toMap(Long::longValue, blogId -> blogService.getById(blogId)));
        Map<Long, UserDTO> usersMap = getAll.stream().map(CommentBlogDTO::getReviewerId).distinct().collect(Collectors
                .toMap(Long::longValue, reviewerId -> userService.getById(reviewerId)));

        model.addAttribute("comments", getAll);
        model.addAttribute("blogsMap", blogsMap);
        model.addAttribute("usersMap", usersMap);
        return "/admin/review/list-comment";
    }

    @GetMapping("/delete/blog/{id}")
    public String deleteBlogReview(@PathVariable(name = "id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        commentBlogService.delete(id);
        return "redirect:/admin/review";
    }
}
