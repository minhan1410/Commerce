package com.example.commerce.service;

import com.example.commerce.model.dto.CouponDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface CouponService {
    CouponDTO findCode(String code, Model model);

    void add(CouponDTO dto);

    List<CouponDTO> getAll();

    void getByExpirationDate(Model model);
}