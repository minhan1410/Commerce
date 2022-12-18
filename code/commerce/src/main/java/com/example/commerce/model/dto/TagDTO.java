package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class TagDTO {
    private Long id;
    private Boolean deleted = false;

    private String type;
}
