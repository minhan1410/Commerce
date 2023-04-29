package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.Date;

@Entity
@Table(name = "coupon")
@Data
public class Coupon {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "code", unique = true)
    private String code;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "expiration_date")
    private LocalDate expirationDate;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
