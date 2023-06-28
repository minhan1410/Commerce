package com.example.commerce.controller.cart;

import com.example.commerce.service.CartService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class CartUserController {
    private final CartService cartService;
    private final UserService userService;
    private final CouponService couponService;

    @GetMapping("/cart")
    public String getAllCartItem(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        return "shoping-cart";
    }

    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam(name = "id") Long id, @RequestParam(name = "size") String size, @RequestParam(name = "num-product") int numberProducts, HttpSession session, Model model) {
        return cartService.addToCart(id, size, numberProducts, session, model);
    }

    @GetMapping("/update-cart")
    public String updateToCart(@RequestParam(name = "id") Long id, @RequestParam(name = "quantity") int quantity, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        return cartService.updateCart(id, quantity, null, request, redirectAttributes);
    }

    @PostMapping("/coupon-cart")
    public String coupon(@RequestParam(name = "coupon") String coupon, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        return cartService.updateCart(null, 0, coupon, request, redirectAttributes);
    }

    @GetMapping("/delete-from-cart")
    public String deleteToCart(@RequestParam(name = "id", required = true) Long id, HttpServletRequest request) {
        return cartService.deleteToCart(id, request);
    }

    @PostMapping("/checkout")
    public String checkout(@RequestParam(name = "receiverName") String receiverName, @RequestParam(name = "shippingAddress") String shippingAddress, @RequestParam(name = "phoneNumber") String phoneNumber, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        return cartService.checkout(receiverName, shippingAddress, phoneNumber, request, redirectAttributes);
    }
}
