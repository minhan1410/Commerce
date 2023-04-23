package com.example.commerce.controller.about;

import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class AboutController {
    private final UserService userService;
    private final CouponService couponService;

    @GetMapping("/about")
    public String aboutUs(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        return "about";
    }
}
