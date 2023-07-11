package com.example.commerce.controller.contact;

import com.example.commerce.constants.TelegramNotificationType;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.TelegramNotificationService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class ContactController {
    private final UserService userService;
    private final CouponService couponService;
    private final TelegramNotificationService telegramService;
    private final CategoriesService categoriesService;

    @GetMapping("/contact")
    public String contact(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("cate", categoriesService.getAll());

        return "contact";
    }

    @PostMapping("/send-help")
    public String sendHelp(@RequestParam(name = "email") String email, @RequestParam(name = "mess") String message) {
        telegramService.sendMessage(TelegramNotificationType.CONTACT, String.format("EMAIL: %s\nMESSAGE:\n%s", email, message));
        return "redirect:/contact";
    }
}
