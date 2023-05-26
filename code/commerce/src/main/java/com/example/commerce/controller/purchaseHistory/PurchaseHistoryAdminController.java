package com.example.commerce.controller.purchaseHistory;

import com.example.commerce.service.BillService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/purchase")
@RequiredArgsConstructor
public class PurchaseHistoryAdminController {
    private final BillService billService;

    @GetMapping()
    public String listCoupon(Model model) {
        model.addAttribute("purchases", billService.getAll());
        return "/admin/purchase/list-purchase";
    }

}
