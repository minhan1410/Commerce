package com.example.commerce.service;

import com.example.commerce.model.dto.CouponDTO;
import org.springframework.ui.Model;

public interface CouponService {
    CouponDTO findCode(String code, Model model);

    void add(CouponDTO dto);
}
