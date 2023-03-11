package com.example.commerce.controller.user;

import com.example.commerce.constants.Role;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.model.entity.User;
import com.example.commerce.repository.UserRepository;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/user")
public class UserAdminController {
    private final UserService userService;
    private final ModelMapper mapper;
    private final UserRepository userRepository;


    @GetMapping()
    public String getAll(Model model) {
        model.addAttribute("users", userService.getAllUsers());
        return "/admin/viewAddUser";
    }

    @PostMapping("/edit")
    public String setAdmin(Model model, @ModelAttribute("userDTO") UserDTO userDTO) {
        User user = userRepository.getById(userDTO.getId());
        user.setRole(Role.ADMIN);
        userRepository.save(user);
        return "redirect:/admin/user";
    }

    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id, Model model) {
        User user = userRepository.getById(id);
        user.setDeleted(true);
        userRepository.save(user);
        return "redirect:/admin/user";
    }
}
