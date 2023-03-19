package com.example.commerce.controller.user;

import com.example.commerce.model.custom.CustomUserDetails;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/user")
public class ProfileController {
    private final UserService userService;
    private final CouponService couponService;

    @GetMapping()
    public String info(Model model) {
        model.addAttribute("user", userService.getCurrentUser());
        couponService.getByExpirationDate(model);
        return "informationUser";
    }

    @PostMapping("/edit")
    public String updateMember(@ModelAttribute(name = "user") UserDTO userDTO) {
        CustomUserDetails principal = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        reload principal
        principal.update(userService.updateMember(userDTO));
        Authentication authentication = new UsernamePasswordAuthenticationToken(principal, principal.getPassword(), principal.getAuthorities());
        SecurityContextHolder.getContext().setAuthentication(authentication);
        return "redirect:/member/user";
    }
}
