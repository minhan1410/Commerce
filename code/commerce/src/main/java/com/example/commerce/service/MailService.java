package com.example.commerce.service;

import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.UserDTO;

import java.util.Map;

public interface MailService {
    void sendMailCart(Map<Long, CartItemDTO> map, Integer totalOfCart, Double totalPrice, Double totalPriceAfterApplyCoupon,String discount, UserDTO currentUser);

    void sendMailRegister(String name, String email, String url);
}
