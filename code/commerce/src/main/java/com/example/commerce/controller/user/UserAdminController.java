package com.example.commerce.controller.user;

import com.example.commerce.constants.Role;
import com.example.commerce.model.entity.User;
import com.example.commerce.repository.UserRepository;
import com.example.commerce.service.CommentBlogService;
import com.example.commerce.service.NotificationService;
import com.example.commerce.service.ReviewService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class UserAdminController {
    private final UserService userService;
    private final UserRepository userRepository;
    private final ReviewService reviewService;
    private final CommentBlogService commentBlogService;
    private final NotificationService notificationService;

    @GetMapping("/user")
    public String getAllRoleIsUser(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("users", userService.getAllUsers());
        return "/admin/user/list-user";
    }

    @GetMapping("/user-admin")
    public String getAllRoleIsAdmin(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("users", userService.getAllAdmin());
        return "/admin/user/list-admin";
    }

    @PostMapping("/user/edit")
    public String setAdmin(Model model, @RequestParam("role") String role, @RequestParam("id") Long id) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        User user = userRepository.getById(id);
        user.setRole(Role.valueOf(role));
        userRepository.save(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        User user = userRepository.getById(id);
        user.setDeleted(true);
        user.setEnabled(false);
        userRepository.save(user);
        // delete review product, comment, notification
        reviewService.deleteByReviewerId(id);
        commentBlogService.deleteByReviewerId(id);
        notificationService.deleteByUser(id);
        return "redirect:/admin/user";
    }
}
