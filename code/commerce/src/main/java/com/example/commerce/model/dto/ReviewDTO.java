package com.example.commerce.model.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class ReviewDTO {
    private Long id;
    private Boolean deleted = false;

    private Long productId;
    private String review;
    private LocalDateTime reviewDate;
    private Long reviewerId;
    private Integer starNumber;
}
