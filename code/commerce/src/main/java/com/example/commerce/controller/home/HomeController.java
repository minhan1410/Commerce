package com.example.commerce.controller.home;

import com.example.commerce.model.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {
    @GetMapping("/home")
    public String login(Model model) {
        model.addAttribute("user", new UserDTO());
        return "home/index";
    }
}
