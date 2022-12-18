package com.example.commerce.model.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

@Data
public class ProductDTO {
    private Long id;
    private String name;
    private Long price;
    private String description;
    private Long categoriesId;
    private String imgMain;
    private String imgHover;
    private String imgSub;
    private Double weight;
    private Long length;
    private Long width;
    private Long height;
    private String material;
    private String colors;
    private String sizes;
    private Boolean deleted = false;
    private MultipartFile imageMain;
    private MultipartFile imageHover;
    private MultipartFile imageSub;
}
