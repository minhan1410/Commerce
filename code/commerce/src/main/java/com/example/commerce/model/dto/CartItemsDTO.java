package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class CartItemsDTO {
    private Long id;
    private ProductDTO product;
    private UserDTO user;
    private int quantity;
}
