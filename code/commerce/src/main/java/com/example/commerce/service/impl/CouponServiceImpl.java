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

import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CouponServiceImpl implements CouponService {
    private final CouponRepository couponRepository;
    private final ModelMapper mapper;

    @Override
    public CouponDTO findCode(String code, Model model) {
        Optional<Coupon> optional = couponRepository.getByCodeAndExpiresFalseAndDeletedFalse(code);
        if (optional.isEmpty()) {
            model.addAttribute("err", "khong ton tai");
            return null;
        }
        Coupon coupon = optional.get();
        if (LocalDate.now().isAfter(coupon.getExpirationDate())) {
            model.addAttribute("err", "code het han");
        }
        return mapper.map(coupon, CouponDTO.class);
    }

    @Override
    @Transactional
    public void add(CouponDTO dto, Model model) {
        Optional<Coupon> optional = couponRepository.findByCodeAndDeleted(dto.getCode(), false);
        if (optional.isPresent()) {
            model.addAttribute("err", "Code is already exist");
            return;
        }
        couponRepository.save(mapper.map(dto, Coupon.class));
    }

    @Override
    @Transactional
    public List<CouponDTO> getAll() {
        List<Coupon> list = couponRepository.getByDeletedFalse();

//        Xoá mã giảm giá hết hạn
        list.stream().filter(coupon -> coupon.getExpirationDate().isBefore(LocalDate.now())).toList()
                .forEach(coupon -> {
                    coupon.setExpires(true);
                    couponRepository.save(coupon);
                });

        return list.stream().sorted(Comparator.comparing(Coupon::getDiscount).reversed()).map(dto -> mapper.map(dto, CouponDTO.class)).toList();
    }

    @Override
    public void getByDiscountMax(Model model) {
        List<CouponDTO> couponDTOS = getAll().stream().filter(c -> !c.getExpires() || c.getExpirationDate().isAfter(LocalDate.now())).toList();
        model.addAttribute("coupon", couponDTOS.size() == 0 ? "There is no discount code" :
                couponDTOS.get(0).getCode() + " - " + couponDTOS.get(0).getDiscount() + "%");
        model.addAttribute("coupons", couponDTOS);
    }

    @Override
    public void update(CouponDTO dto, Model model) {
        Optional<Coupon> optional = couponRepository.findByCodeAndDeleted(dto.getCode(), false);
        if (optional.isPresent() && !optional.get().getId().equals(dto.getId())) {
            model.addAttribute("err", "Code is already exist");
            return;
        }
        Coupon getById = couponRepository.getById(dto.getId());
        getById.update(dto).setExpires(getById.getExpirationDate().isBefore(LocalDate.now()));
        couponRepository.save(getById);
    }

    @Override
    public void delete(Long id) {
        Optional<Coupon> byId = couponRepository.findByIdAndDeletedFalse(id);
        byId.get().setDeleted(true);
        couponRepository.save(byId.get());
    }
}
