package com.example.commerce.controller.user;

import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/user")
public class UserAdminController {
    private final UserService userService;

    @GetMapping()
    public String getAll(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "/admin/viewAddUser";
    }
}
