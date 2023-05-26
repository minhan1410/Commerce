package com.example.commerce.service;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartItemDTO;

import java.util.List;

public interface BillService {
    List<BillDTO> getAll();

    List<BillDTO> getAllByUser(Long userId);

    List<BillDTO> getAllByCurrentUser();

    BillDTO getById(Long id);

    List<CartItemDTO> getCartItemById(Long id);
}
