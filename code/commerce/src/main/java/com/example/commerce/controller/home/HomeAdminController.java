package com.example.commerce.controller.home;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class HomeAdminController {
    @GetMapping()
    public String home(Model model, HttpServletRequest request) {
        return "admin/index";
    }
}
