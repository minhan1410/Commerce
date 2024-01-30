package com.example.commerce.service;

import com.example.commerce.model.ChargeRequest;
import com.example.commerce.model.dto.CartDTO;
import com.stripe.exception.*;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface CartService {
    String addToCart(Long id, String size, int numberProducts, HttpSession session, Model model);

    String updateCart(Long id, int quantity, String coupon, HttpServletRequest request, RedirectAttributes redirectAttributes);

    String deleteToCart(Long id, HttpServletRequest req);

    String checkout(String receiverName, String shippingAddress, String phoneNumber, HttpServletRequest request, RedirectAttributes redirectAttributes);

    String checkoutWithCard(String receiverName, String shippingAddress, String phoneNumber, ChargeRequest chargeRequest, HttpServletRequest request, RedirectAttributes redirectAttributes) throws APIConnectionException, APIException, AuthenticationException, InvalidRequestException, CardException;

    CartDTO getById(Long id);
}