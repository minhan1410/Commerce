package com.example.commerce.service;

import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.model.entity.Bill;

import java.util.Map;

public interface MailService {
    void sendMailCart(Map<Long, CartItemDTO> map, Bill bill, UserDTO currentUser, String discount);

    void sendMailRegister(String name, String email, String url);
}
