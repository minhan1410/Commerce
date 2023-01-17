package com.example.commerce.repository;

import com.example.commerce.model.entity.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> getByReviewerIdAndDeleted(Long reviewerId, Boolean deleted);

    List<Review> getByProductIdAndDeleted(Long productId, Boolean deleted);

    List<Review> getByDeleted(Boolean deleted);

    long countByProductIdAndDeleted(Long productId, Boolean deleted);

}