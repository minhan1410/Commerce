package com.example.commerce.model.dto;

import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Data
public class ReviewDTO {
    private Long id;
    private Boolean deleted = false;
    @NotNull(message = "productId not null")
    private Long productId;
    private ProductDTO product;
    @NotBlank(message = "review not bank")
    private String review;
    @NotNull(message = "reviewerId not null")
    private Long reviewerId;
    private UserDTO reviewer;
    private Integer starNumber = 0;
}
