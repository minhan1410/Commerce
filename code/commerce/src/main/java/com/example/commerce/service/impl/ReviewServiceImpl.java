package com.example.commerce.service.impl;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.model.entity.Review;
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
    public String add(ReviewDTO dto) {
//        userService.getCurrentUser(model);

        dto.setReviewerId(userService.getCurrentUser().getId());
//        dto.setProductId(dto.getProductId());
        for (ProductDTO productDTO : productService.getRelatedByName(productService.getById(dto.getProductId()).getName())) {
//            dto.setProductId(productDTO.getId());
            Review review = mapper.map(dto, Review.class);
            review.setProductId(productDTO.getId());
            review.setReviewDate(LocalDateTime.now());
            reviewRepository.save(review);
        }

        return "redirect:/product-detail?id=" + dto.getProductId();
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
