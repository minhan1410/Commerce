package com.example.commerce.service;

import com.example.commerce.constants.BillStatus;
import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartItemDTO;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public interface BillService {
    List<BillDTO> getAll();

    List<BillDTO> getAllByUser(Long userId);

    List<BillDTO> getAllByCurrentUser();

    BillDTO getById(Long id);

    List<CartItemDTO> getCartItemById(Long id);

    void setStatus(Long id, BillStatus status);

    void export(HttpServletResponse response) throws IOException;
}
