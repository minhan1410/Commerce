package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.model.entity.Coupon;
import com.example.commerce.repository.CouponRepository;
import com.example.commerce.service.CouponService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Date;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {
    private final CouponRepository couponRepository;
    private final ModelMapper mapper;

    @Override
    public CouponDTO findCode(String code, Model model) {
        Optional<Coupon> optional = couponRepository.findByCodeAndDeleted(code, false);
        if (optional.isEmpty()) {
            model.addAttribute("err", "khong ton tai");
            return null;
        }
        Coupon coupon = optional.get();
        if (new Date().after(coupon.getExpirationDate())) {
            model.addAttribute("err", "code het han");
        }
        return mapper.map(coupon, CouponDTO.class);
    }

    @Override
    public void add(CouponDTO dto) {
        Optional<Coupon> optional = couponRepository.findByCodeAndDeleted(dto.getCode(), false);
        if (optional.isPresent()) {
            return;
        }
        couponRepository.save(mapper.map(dto, Coupon.class));
    }
}
