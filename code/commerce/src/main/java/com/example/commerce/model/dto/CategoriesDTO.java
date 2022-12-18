package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class CategoriesDTO {
    private Long id;
    private String type;
    private Boolean deleted = false;
}
