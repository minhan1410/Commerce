package com.example.commerce.controller.user;

import com.example.commerce.constants.Role;
import com.example.commerce.model.entity.User;
import com.example.commerce.repository.UserRepository;
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


    @GetMapping("/user")
    public String getAllRoleIsUser(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "/admin/user/list-user";
    }

    @GetMapping("/user-admin")
    public String getAllRoleIsAdmin(Model model) {
        model.addAttribute("users", userService.getAllAdmin());
        return "/admin/user/list-admin";
    }

    @PostMapping("/user/edit")
    public String setAdmin(Model model, @RequestParam("role") String role, @RequestParam("id") Long id) {
        User user = userRepository.getById(id);
        user.setRole(Role.valueOf(role));
        userRepository.save(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/user/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id, Model model) {
        User user = userRepository.getById(id);
        user.setDeleted(true);
        userRepository.save(user);
        return "redirect:/admin/user";
    }
}
