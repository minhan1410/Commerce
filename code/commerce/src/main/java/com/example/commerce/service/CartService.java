package com.example.commerce.service;

import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface CartService {
    String addToCart(Long id, String size, int numberProducts, HttpSession session, Model model);

    String updateCart(Long id, int quantity, String coupon, HttpServletRequest request, Model model);

    String deleteToCart(Long id, HttpServletRequest req);

    String checkout(String receiverName, String shippingAddress, String phoneNumber, HttpServletRequest request);
}
