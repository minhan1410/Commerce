package com.example.commerce.model.dto;

import lombok.Data;

@Data

public class BlogTagDTO {
    private Long id;
    private Long blogId;
    private Boolean deleted;
    private Integer tagId;
}
