package com.example.commerce.model.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;
import java.util.Date;

@Data
public class CouponDTO {
    private Long id;
    private String code;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private LocalDate expirationDate;
    private Integer discount;
    private Boolean expires = false;
    private Boolean deleted = false;
}
