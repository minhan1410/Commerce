package com.example.commerce.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;

@Data
public class CategoriesDTO {
    private Long id;
    @NotBlank(message = "Type not bank")
    private String type;
    private Boolean deleted = false;
}
