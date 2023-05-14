package com.example.commerce.controller.bill;

import com.example.commerce.service.BillService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
public class PurchaseHistoryUserController {
    private final UserService userService;
    private final BillService billService;
    private final CouponService couponService;

    @GetMapping("purchase-history")
    public String purchaseHistory(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("bills", billService.getAllByCurrentUser());
        model.addAttribute("billService", billService);
        return "purchase-history";
    }

    @GetMapping("/bill-detail")
    public String billDetail(@RequestParam(name = "id") Long id, Model model) {
        billService.getBillDetail(id, model);
        return "error/notFound";
    }
}
