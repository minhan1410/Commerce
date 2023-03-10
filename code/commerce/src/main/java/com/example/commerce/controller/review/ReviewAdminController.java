package com.example.commerce.controller.review;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.ReviewDTO;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.ReviewService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/admin/review")
@RequiredArgsConstructor
public class ReviewAdminController {
    private final ReviewService reviewService;
    private final ProductService productService;
    private final UserService userService;

    @GetMapping()
    public String getComment(Model model) {
        List<ReviewDTO> getAll = reviewService.getAll();
        Map<Long, ProductDTO> productsMap = getAll.stream().map(ReviewDTO::getProductId).distinct().collect(Collectors
                .toMap(Long::longValue, productId -> productService.getById(productId, model)));
        Map<Long, String> usersMap = getAll.stream().map(ReviewDTO::getReviewerId).distinct().collect(Collectors
                .toMap(Long::longValue, reviewerId -> userService.getById(reviewerId).getName()));

        model.addAttribute("reviews", getAll);
        model.addAttribute("productsMap", productsMap);
        model.addAttribute("usersMap", usersMap);
        return "/admin/viewReview";
    }

    @GetMapping("/delete/{id}")
    public String deleteReview(@PathVariable(name = "id") Long id) {
        reviewService.delete(id);
        return "redirect:/admin/review";
    }
}
