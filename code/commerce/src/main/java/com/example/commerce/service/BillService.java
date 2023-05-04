package com.example.commerce.service;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartItemDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface BillService {
    List<BillDTO> getAllByUser(Long userId);

    List<BillDTO> getAllByCurrentUser();

    BillDTO getById(Long id);

    void getBillDetail(Long id, Model model);

    List<CartItemDTO> getCartItemById(Long id);
}
