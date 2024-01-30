package com.example.commerce.controller.login;

import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final UserService userService;

    @GetMapping("/login")
    public String login(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        model.addAttribute("user", new UserDTO());
        model.addAttribute("err", session.getAttribute("err"));
        return "login";
    }

    @PostMapping("/sign-up")
    public String signUp(@Valid @ModelAttribute("user") UserDTO userDTO, Model model, HttpServletRequest request) {
        userService.signUp(userDTO, model, request.getLocale(), request.getRequestURL().toString().replace(request.getRequestURI(), ""));
        return "login";
    }

    @GetMapping("/verify")
    public String veryficationCode(@RequestParam(name = "code") String code, RedirectAttributes redirectAttributes, HttpServletRequest request) {
        userService.veryficationCode(code, redirectAttributes, request.getLocale());
        return "redirect:/login";
    }
}
