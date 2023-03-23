package com.example.commerce.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartItemDTO {
    private Long id;
    private ProductDTO product;
    private Long cartId;
    private int quantity;
    private Boolean deleted = false;
}
