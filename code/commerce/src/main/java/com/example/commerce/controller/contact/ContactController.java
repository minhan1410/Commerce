package com.example.commerce.controller.contact;

import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class ContactController {
    private final UserService userService;
    private final CouponService couponService;

    @GetMapping("/contact")
    public String contact(Model model) {
        userService.getCurrentUser(model);
        couponService.getByExpirationDate(model);
        return "contact";
    }
}
