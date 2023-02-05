package com.example.commerce.model.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class CartItemsDTO {
    private Long id;
    private ProductDTO product;
    private Long billId;
    private int quantity;
    private UserDTO user;
}
