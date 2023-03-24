package com.example.commerce.service;

import com.example.commerce.model.dto.CartItemDTO;

import java.util.Map;

public interface MailService {
    void sendMailCart(Map<Long, CartItemDTO> map, Integer totalOfCart, Double totalPrice, Double totalPriceAfterApplyCoupon, String email);

    void sendMailRegister(String name, String email, String url);
}
