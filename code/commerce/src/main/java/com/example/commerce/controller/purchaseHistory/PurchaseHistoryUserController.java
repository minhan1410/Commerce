package com.example.commerce.controller.purchaseHistory;

import com.example.commerce.service.BillService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("purchase-history")
public class PurchaseHistoryUserController {
    private final UserService userService;
    private final BillService billService;
    private final CouponService couponService;

    @GetMapping()
    public String purchaseHistory(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("bills", billService.getAllByCurrentUser());
        return "purchase-history";
    }

    @GetMapping("/{id}")
    public String billDetail(@PathVariable(name = "id") Long id, Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("bill", billService.getById(id));
        return "purchase-history-info";
    }
}
