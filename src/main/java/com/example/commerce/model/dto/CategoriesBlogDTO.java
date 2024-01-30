package com.example.commerce.model.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoriesBlogDTO {
    private Long id;
    private String type;
    private Boolean deleted = false;

}
