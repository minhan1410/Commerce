package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class CouponDTO {
    private Long id;
    private String code;
    private Boolean deleted = false;

    private Integer discount;
}
