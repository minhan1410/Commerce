package com.example.commerce.controller.contact;

import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ContactController {
    private final UserService userService;

    @GetMapping("/contact")
    public String contact(Model model) {
        userService.getCurrentUser(model);
        return "contact";
    }
}
