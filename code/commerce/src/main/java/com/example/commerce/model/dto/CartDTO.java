package com.example.commerce.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartDTO {
    private Long id;
    private ProductDTO product;
    private UserDTO user;
    private int quantity;
    private Boolean deleted = false;
}
