package com.example.commerce.service;

import com.example.commerce.model.dto.ReviewDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface ReviewService {
    List<ReviewDTO> getAll();

    List<ReviewDTO> getByProductId(Long productId, Model model);

    List<ReviewDTO> getByReviewerId(Long reviewerId, Model model);

    ReviewDTO getById(Long id, Model model);

    long countProduct(Long id);

    String add(ReviewDTO dto, Model model);

    String update(ReviewDTO dto, Model model);

    String delete(Long id, Model model);
}
