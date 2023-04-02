package com.example.commerce.service;

import com.example.commerce.model.dto.ReviewDTO;

import java.util.List;

public interface ReviewService {
    List<ReviewDTO> getAll();

    List<ReviewDTO> getByProductId(Long productId);

    List<ReviewDTO> getByReviewerId(Long reviewerId);

    ReviewDTO getById(Long id);

    long countProduct(Long id);

    String add(ReviewDTO dto);

    String update(ReviewDTO dto);

    String delete(Long id);

    void deleteByProduct(Long productId);
}
