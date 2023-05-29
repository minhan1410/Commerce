package com.example.commerce.controller.home;

import com.example.commerce.service.MessageService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class HomeAdminController {
    private final UserService userService;
    private final MessageService messageService;

    @GetMapping()
    public String home(Model model) {
        userService.getCurrentUser(model);
        model.addAttribute("noti", messageService.getAllMessageIsSeenFalse());
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
