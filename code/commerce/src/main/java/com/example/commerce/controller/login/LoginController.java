package com.example.commerce.controller.login;

import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
public class LoginController {
    private final UserService userService;
    private final MessageSource messageSource;

    @GetMapping(value = {"/", "/login"})
    public String login(@RequestParam(name = "err", required = false) String err, Model model, HttpServletRequest request) {
        model.addAttribute("user", new UserDTO());
        if (!ValueConstants.DEFAULT_NONE.equals(err)) {
            model.addAttribute("err", messageSource.getMessage(err, null, null, request.getLocale()));
        }
        return "login";
    }

    @PostMapping("/sign-up")
    public String signUp(@Valid @ModelAttribute("user") UserDTO userDTO, Model model, HttpServletRequest request) {
        userService.signUp(userDTO, model, request.getLocale(), request.getRequestURL().toString().replace(request.getRequestURI(), ""));
        return "login";
    }

    @GetMapping("/verify")
    public String veryficationCode(@RequestParam(name = "code") String code, Model model, HttpServletRequest request) {
        userService.veryficationCode(code, model, request.getLocale());
        return "redirect:/login";
    }
}
