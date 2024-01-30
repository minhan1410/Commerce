package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "review")
@Data
public class Review {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "review")
    private String review;

    @Column(name = "star_number")
    private Integer starNumber;

    @Column(name = "review_date")
    private LocalDateTime reviewDate;

    @Column(name = "reviewer_id")
    private Long reviewerId;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
