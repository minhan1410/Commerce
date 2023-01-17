package com.example.commerce.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

@Data
public class ReviewDTO {
    private Long id;
    private Boolean deleted = false;
    @NotNull(message = "productId not null")
    private Long productId;
    @NotBlank(message = "review not bank")
    private String review;
    private LocalDateTime reviewDate;
    @NotNull(message = "reviewerId not null")
    private Long reviewerId;
    private Integer starNumber = 0;
}
