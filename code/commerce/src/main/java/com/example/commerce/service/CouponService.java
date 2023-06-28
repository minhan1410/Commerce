package com.example.commerce.service;

import com.example.commerce.model.dto.CouponDTO;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

public interface CouponService {
    CouponDTO findCode(String code, RedirectAttributes redirectAttributes);

    void add(CouponDTO dto, Model model);

    List<CouponDTO> getAll();

    void getByDiscountMax(Model model);

    void update(CouponDTO dto, Model model);

    void delete(Long id);

    CouponDTO getById(Long couponId);
}
