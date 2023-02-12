package com.example.commerce.model.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Data
public class BlogDTO {
    private Long id;
    private String title;
    private String content;
    private Long categoryBlogId;
    private String createdTime;
    private Integer createdDay;
    private String createdMonth;
    private MultipartFile img;
    private String image;
    private Boolean deleted = false;
    private List<TagDTO> tags;
}
