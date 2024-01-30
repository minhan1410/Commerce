package com.example.commerce.controller.user;

import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/member/user")
public class ProfileUserController {
    private final UserService userService;
    private final CouponService couponService;
    private final CategoriesService categoriesService;

    @GetMapping()
    public String info(Model model) {
        model.addAttribute("user", userService.getCurrentUser());
        model.addAttribute("cate", categoriesService.getAll());
        couponService.getByDiscountMax(model);
        return "informationUser";
    }

    @PostMapping("/edit")
    public String updateMember(@ModelAttribute(name = "user") UserDTO userDTO, RedirectAttributes redirectAttributes) {
//        CustomUserDetails principal = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
////        reload principal
//        principal.update(userService.updateMember(userDTO));
//        Authentication authentication = new UsernamePasswordAuthenticationToken(principal, principal.getPassword(), principal.getAuthorities());
//        SecurityContextHolder.getContext().setAuthentication(authentication);
        userService.updateMember(userDTO);
        redirectAttributes.addFlashAttribute("noti", "Logout to apply changes");
        return "redirect:/member/user";
    }

    @PostMapping("/change-password")
    public String changePassword(@RequestParam(name = "currentPassword") String currentPassword, @RequestParam(name = "newPassword") String newPassword, RedirectAttributes redirectAttributes) {
        userService.changePassword(currentPassword, newPassword, redirectAttributes);
        return "redirect:/member/user";
    }
}