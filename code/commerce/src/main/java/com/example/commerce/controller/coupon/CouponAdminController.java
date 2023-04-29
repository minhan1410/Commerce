package com.example.commerce.controller.coupon;

import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.service.CouponService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin/coupon")
@RequiredArgsConstructor
public class CouponAdminController {
    private final CouponService couponService;

    @GetMapping()
    public String listCoupon(Model model) {
        model.addAttribute("coupons", couponService.getAll());
        return "/admin/coupon/list-coupon";
    }

    @PostMapping("/new")
    public String add(@ModelAttribute("coupon") CouponDTO dto, Model model) {
        couponService.add(dto, model);
        return "redirect:/admin/coupon";
    }

    @PostMapping("/update")
    public String update(Model model){
        return "redirect:/admin/coupon";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable("id") Long id, Model model){
        couponService.delete(id);
        return "redirect:/admin/coupon";
    }
}
