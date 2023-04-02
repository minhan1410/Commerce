package com.example.commerce.service;

import com.example.commerce.model.dto.BillDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface BillService {
    List<BillDTO> getAllByUser(Long userId);

    List<BillDTO> getAllByCurrentUser();

    BillDTO getById(Long id);

    void getBillDetail(Long id, Model model);
}
