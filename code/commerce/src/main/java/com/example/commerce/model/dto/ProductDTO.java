package com.example.commerce.model.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class ProductDTO {
    private Long id;
    @NotBlank(message = "name not bank")
    private String name;
    private Long price;
    private String description;
    private Long categoriesId;
    private String imgMain;
    private String imgHover;
    private String imgSub;
    private String material;
    private String color;
    private String size;
    private Integer quantity;
    private Boolean deleted = false;
    @NotNull(message = "imageMain not null")
    private MultipartFile imageMain;
    @NotNull(message = "imageHover not null")
    private MultipartFile imageHover;
    @NotNull(message = "imageSub not null")
    private MultipartFile imageSub;
}
