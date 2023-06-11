package com.example.commerce.controller.home;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.service.BillService;
import com.example.commerce.service.MessageService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static com.example.commerce.constants.BillStatus.WAIT;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class HomeAdminController {
    private final UserService userService;
    private final MessageService messageService;
    private final BillService billService;

    @GetMapping()
    public String home(Model model) {
        List<BillDTO> bills = billService.getAll();
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
        model.addAttribute("countUnconfirmedBills", bills.stream().filter(billDTO -> billDTO.getStatus().equals(WAIT)).count());
        model.addAttribute("sumTotalCart", bills.stream().mapToLong(BillDTO::getTotalCart).sum());
        model.addAttribute("sumPrice", bills.stream().mapToDouble(BillDTO::getPriceTotal).sum());
        return "admin/index";
    }

    @GetMapping("/view-noti/{id}")
    public String viewNoti(@PathVariable Long id, HttpServletRequest request) {
        messageService.viewMessage(id);
        return "redirect:" + request.getHeader("referer").replace(" http://localhost:8080//admin", "");
    }

    @GetMapping("/view-all")
    public String viewAll(HttpServletRequest request) {
        messageService.viewAll();
        return "redirect:" + request.getHeader("referer").replace(" http://localhost:8080//admin", "");
    }
}
