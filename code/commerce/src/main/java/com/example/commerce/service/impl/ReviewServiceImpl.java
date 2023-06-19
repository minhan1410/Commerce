package com.example.commerce.service.impl;

import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.model.entity.Review;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.repository.ReviewRepository;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.ReviewService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ReviewServiceImpl implements ReviewService {
    private final ModelMapper mapper;
    private final ReviewRepository reviewRepository;
    private final UserService userService;
    private final ProductService productService;
    private final BillRepository billRepository;

    @Override
    public List<ReviewDTO> getAll() {
        return reviewRepository.getByDeleted(false).stream().map(review -> mapper.map(review, ReviewDTO.class)).toList();
    }

    @Override
    public List<ReviewDTO> getByProductId(Long productId) {
        return reviewRepository.getByProductIdAndDeleted(productId, false).stream()
                .map(review -> mapper.map(review, ReviewDTO.class)).toList();
    }

    @Override
    public List<ReviewDTO> getByProductIds(List<Long> ids) {
        List<ReviewDTO> reviewDTOS = reviewRepository.getByProductIdInAndDeletedFalse(ids).stream()
                .map(review -> mapper.map(review, ReviewDTO.class)).toList();
        reviewDTOS.forEach(reviewDTO -> {
            reviewDTO.setReviewer(userService.getById(reviewDTO.getReviewerId()));
            reviewDTO.setProduct(productService.getById(reviewDTO.getProductId()));
        });
        return reviewDTOS;
    }

    @Override
    public List<ReviewDTO> getByReviewerId(Long reviewerId) {
        return reviewRepository.getByReviewerIdAndDeleted(reviewerId, false).stream()
                .map(review -> mapper.map(review, ReviewDTO.class)).toList();
    }

    @Override
    public ReviewDTO getById(Long id) {
        Optional<Review> findById = reviewRepository.findById(id);
        if (findById.isEmpty()) {
            return null;
        }
        return mapper.map(findById.get(), ReviewDTO.class);
    }

    @Override
    public long countProduct(Long id) {
        return reviewRepository.countByProductIdAndDeleted(id, false);
    }

    @Override
    @Transactional
    public void add(ReviewDTO dto) {
        if (billRepository.hasCartItems(dto.getReviewerId(), dto.getProductId())) {
            Review review = mapper.map(dto, Review.class);
            review.setReviewDate(LocalDateTime.now());
            if (review.getReviewerId() == null) {
                review.setReviewerId(userService.getCurrentUser().getId());
            }
            reviewRepository.save(review);
        }
    }

    @Override
    @Transactional

    public String update(ReviewDTO dto) {
        return null;
    }

    @Override
    @Transactional
    public String delete(Long id) {
        Review byId = reviewRepository.getById(id);
        byId.setDeleted(true);
        reviewRepository.save(byId);
        return null;
    }

    @Override
    @Transactional
    public void deleteByProduct(Long productId) {
        List<Review> getAll = reviewRepository.getByDeleted(false);
        getAll.forEach(r -> {
            if (r.getProductId().equals(productId)) {
                r.setDeleted(true);
            }
        });
        reviewRepository.saveAll(getAll);
    }

}
