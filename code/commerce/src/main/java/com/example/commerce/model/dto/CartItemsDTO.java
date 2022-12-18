package com.example.commerce.model.dto;

import lombok.Data;

@Data

public class CartItemsDTO {
    private Long id;
    private Long billId;
    private Boolean deleted = false;

    private Long productId;
    private Integer quantity;
}
