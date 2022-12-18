package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class BlogDTO {
    private Long id;
    private String title;
    private String content;
    private Long categoryId;
    private String createdTime;
    private Integer createdDay;
    private String createdMonth;
    private String image;
    private Boolean deleted = false;

}
