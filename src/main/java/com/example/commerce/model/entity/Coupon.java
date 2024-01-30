package com.example.commerce.model.entity;

import com.example.commerce.model.dto.CouponDTO;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "coupon")
@Data
public class Coupon {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "code", unique = true)
    private String code;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "expiration_date")
    private LocalDate expirationDate;

    @Column(name = "expires", columnDefinition = "boolean default false")
    private Boolean expires;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public Coupon update(CouponDTO dto) {
        this.code = dto.getCode();
        this.discount = dto.getDiscount();
        this.expirationDate = dto.getExpirationDate();
        return this;
    }
}
