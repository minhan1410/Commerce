package com.example.commerce.controller.cart;

import com.example.commerce.service.CartItemsService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class CartUserController {
    private final CartItemsService cartItemsService;
    private final UserService userService;

    @GetMapping("/cart")
    public String getAllCartItem(Model model) {
        userService.getCurrentUser(model);
        return "shoping-cart";
    }

    @PostMapping("/add-to-cart")
    public String addToCart(@RequestParam(name = "id") Long id, @RequestParam(name = "size") String size, @RequestParam(name = "num-product") int numberProducts, HttpSession session, Model model) {
        return cartItemsService.addToCart(id, size, numberProducts, session, model);
    }

    @GetMapping("/update-cart")
    public String updateToCart(@RequestParam(name = "id") Long id, @RequestParam(name = "quantity") int quantity, HttpServletRequest request, Model model) {
        return cartItemsService.updateCart(id, quantity, null, request, model);
    }

    @PostMapping("/coupon-cart")
    public String coupon(@RequestParam(name = "coupon") String coupon, HttpServletRequest request, Model model) {
        return cartItemsService.updateCart(null, 0, coupon, request, model);
    }

    @GetMapping("/delete-from-cart")
    public String deleteToCart(@RequestParam(name = "id", required = true) Long id, HttpServletRequest request) {
        return cartItemsService.deleteToCart(id, request);
    }
}
