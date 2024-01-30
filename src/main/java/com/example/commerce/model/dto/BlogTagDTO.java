package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class BlogTagDTO {
    private Long id;
    private Long blogId;
    private Long tagId;
    private Boolean deleted = false;
}
