package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "coupon")
@Data
public class Coupon {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "code")
    private String code;

    @Column(name = "discount")
    private Integer discount;

    @Column(name = "deleted")
    private Boolean deleted;
}
