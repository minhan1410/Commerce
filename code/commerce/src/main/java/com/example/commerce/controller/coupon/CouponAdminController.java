package com.example.commerce.controller.coupon;

import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.MessageService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/coupon")
@RequiredArgsConstructor
public class CouponAdminController {
    private final CouponService couponService;
    private final UserService userService;
    private final MessageService messageService;

    @GetMapping()
    public String listCoupon(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        model.addAttribute("coupons", couponService.getAll());
        return "/admin/coupon/list-coupon";
    }

    @PostMapping("/new")
    public String add(@ModelAttribute("coupon") CouponDTO dto, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        couponService.add(dto, model);
        return "redirect:/admin/coupon";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute("coupon") CouponDTO dto, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        couponService.update(dto, model);
        model.addAttribute("coupons", couponService.getAll());
        return "/admin/coupon/list-coupon";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        couponService.delete(id);
        return "redirect:/admin/coupon";
    }
}
