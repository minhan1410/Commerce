package com.example.commerce.model.dto;

import lombok.Data;

import java.time.LocalDateTime;
@Data
public class BillDTO {
    private Long id;
    private LocalDateTime billDate;
    private Long priceTotal;
    private Integer discountPercent;
    private Long buyerId;
    private String status;
    private String pay;
    private Boolean deleted;
}
