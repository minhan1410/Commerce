package com.example.commerce.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CategoriesDTO {
    private Long id;
    @NotBlank(message = "Type not bank")
    private String type;
    private Boolean deleted = false;
}
