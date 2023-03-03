package com.example.commerce.controller.user;

import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/user")
public class ProfileController {
    private final UserService userService;

    @GetMapping()
    public String info(Model model) {
        model.addAttribute("user", userService.getCurrentUser());
        return "informationUser";
    }

    @PostMapping("/edit")
    public String updateMember(@ModelAttribute(name = "user") UserDTO userDTO, Model model) {
        model.addAttribute("user", userService.updateMember(userDTO));

        return "informationUser";
    }
}
