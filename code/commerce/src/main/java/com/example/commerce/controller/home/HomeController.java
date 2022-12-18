package com.example.commerce.controller.home;

import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.custom.CustomUserDetails;
import com.example.commerce.model.entity.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class HomeController {
    @GetMapping("/home")
    public String home(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = principal instanceof String ? new User() : principal instanceof CustomUserDetails ? ((CustomUserDetails) principal).getUser() : ((CustomOAuth2User) principal).getUser();
        model.addAttribute("id", user.getId());
        model.addAttribute("user", user);
        return "/index";
    }
}
