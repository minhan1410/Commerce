package com.example.commerce.controller.purchaseHistory;

import com.example.commerce.service.BillService;
import com.example.commerce.service.MessageService;
import com.example.commerce.service.UserService;
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
    private final UserService userService;
    private final MessageService messageService;

    @GetMapping()
    public String listCoupon(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        model.addAttribute("bills", billService.getAll());
        return "/admin/purchase/list-purchase";
    }

}
