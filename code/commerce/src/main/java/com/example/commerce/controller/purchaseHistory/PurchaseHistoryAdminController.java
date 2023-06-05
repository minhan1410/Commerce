package com.example.commerce.controller.purchaseHistory;

import com.example.commerce.constants.BillStatus;
import com.example.commerce.service.BillService;
import com.example.commerce.service.MessageService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/admin/purchase")
@RequiredArgsConstructor
public class PurchaseHistoryAdminController {
    private final BillService billService;
    private final UserService userService;
    private final MessageService messageService;
    private final SimpMessagingTemplate simpMessagingTemplate;

    @GetMapping()
    public String listCoupon(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        model.addAttribute("bills", billService.getAll());
        return "/admin/purchase/list-purchase";
    }

    @GetMapping("/{id}")
    public String setStatus(@PathVariable("id") Long id, @RequestParam("status") BillStatus status) {
        billService.setStatus(id, status);
        simpMessagingTemplate.convertAndSend("/purchase/" + id, status.name());
        return "redirect:/admin/purchase";
    }

    @GetMapping("/export")
    public void export(HttpServletResponse response) throws IOException {
        billService.export(response);
//        return "redirect:/admin/purchase";
    }
}
