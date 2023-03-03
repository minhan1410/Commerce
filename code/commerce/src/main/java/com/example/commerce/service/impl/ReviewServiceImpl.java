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
import org.springframework.ui.Model;

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
    public List<ReviewDTO> getByProductId(Long productId, Model model) {
        return reviewRepository.getByProductIdAndDeleted(productId, false).stream().map(review -> mapper.map(review, ReviewDTO.class)).toList();
    }

    @Override
    public List<ReviewDTO> getByReviewerId(Long reviewerId, Model model) {
        return reviewRepository.getByReviewerIdAndDeleted(reviewerId, false).stream().map(review -> mapper.map(review, ReviewDTO.class)).toList();
    }

    @Override
    public ReviewDTO getById(Long id, Model model) {
        Optional<Review> findById = reviewRepository.findById(id);
        if (findById.isEmpty()) {
            model.addAttribute("err", "id k ton tai");
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
    public String add(ReviewDTO dto, Model model) {
        userService.getCurrentUser(model);

        dto.setReviewerId(userService.getCurrentUser().getId());
//        dto.setProductId(dto.getProductId());
        for (ProductDTO productDTO : productService.getRelatedByName(productService.getById(dto.getProductId(), model).getName())) {
            dto.setProductId(productDTO.getId());
            reviewRepository.save(mapper.map(dto, Review.class));
        }

        return "redirect:/product-detail?id=" + dto.getProductId();
    }

    @Override
    @Transactional

    public String update(ReviewDTO dto, Model model) {
        return null;
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
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
