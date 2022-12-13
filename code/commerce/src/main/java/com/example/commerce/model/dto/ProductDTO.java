package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class ProductDTO {
    private Long id;
    private String name;
    private Long price;
    private String description;
    private Integer categoriesId;
    private String imgMain;
    private String imgHover;
    private String imgSub;
    private Boolean deleted;
}
