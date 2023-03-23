package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class CartDTO {
    private Long id;
    private Long userId;
    private Boolean deleted = false;
}
