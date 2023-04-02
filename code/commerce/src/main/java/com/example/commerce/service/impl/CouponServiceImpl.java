package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.model.entity.Coupon;
import com.example.commerce.repository.CouponRepository;
import com.example.commerce.service.CouponService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.Comparator;
import java.util.Date;
import java.util.List;
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
    @Transactional
    public void add(CouponDTO dto) {
        Optional<Coupon> optional = couponRepository.findByCodeAndDeleted(dto.getCode(), false);
        if (optional.isPresent()) {
            return;
        }
        couponRepository.save(mapper.map(dto, Coupon.class));
    }

    @Override
    @Transactional
    public List<CouponDTO> getAll() {
        List<Coupon> list = couponRepository.getByDeletedFalse();
        list.stream().filter(coupon -> coupon.getExpirationDate().before(new Date())).toList().forEach(coupon ->
        {
            coupon.setDeleted(true);
            couponRepository.save(coupon);
        });
        return list.stream().map(dto -> mapper.map(dto, CouponDTO.class)).toList();
    }

    @Override
    public void getByExpirationDate(Model model) {
        List<CouponDTO> couponDTOS = getAll().stream().filter(coupon -> coupon.getExpirationDate().after(new Date())).sorted(Comparator.comparing(CouponDTO::getDiscount)).toList();
        model.addAttribute("coupon", couponDTOS.size() == 0 ? "There is no discount code" : couponDTOS.get(0).getCode() + " - " + couponDTOS.get(0).getDiscount() + "%");
        model.addAttribute("coupons", couponDTOS);
    }
}