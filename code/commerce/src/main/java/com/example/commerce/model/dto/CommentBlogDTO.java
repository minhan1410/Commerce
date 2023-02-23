package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class CommentBlogDTO {
    private Long id;
    private Long blogId;
    private String comment;
    private Long reviewerId;
    private Boolean deleted = false;
}
