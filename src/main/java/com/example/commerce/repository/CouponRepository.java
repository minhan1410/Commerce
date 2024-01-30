package com.example.commerce.repository;

import com.example.commerce.model.entity.Coupon;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CouponRepository extends JpaRepository<Coupon, Long> {
    Optional<Coupon> findByCodeAndDeleted(String code, Boolean deleted);

    Optional<Coupon> getByCodeAndExpiresFalseAndDeletedFalse(String code);

    List<Coupon> getByDeletedFalse();

    Optional<Coupon> findByIdAndDeletedFalse(Long id);

}