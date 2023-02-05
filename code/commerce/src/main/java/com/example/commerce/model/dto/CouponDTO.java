package com.example.commerce.model.dto;

import lombok.Data;

import java.util.Date;

@Data
public class CouponDTO {
    private Long id;
    private String code;
    private Date expirationDate;
    private Integer discount;
    private Boolean deleted = false;
}
