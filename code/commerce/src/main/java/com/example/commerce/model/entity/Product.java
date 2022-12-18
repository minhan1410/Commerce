package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "product")
@Data
public class Product {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "price")
    private Long price;

    @Column(name = "description")
    private String description;

    @Column(name = "categories_id")
    private Integer categoriesId;

    @Column(name = "img_main")
    private String imgMain;

    @Column(name = "img_hover")
    private String imgHover;

    @Column(name = "img_sub")
    private String imgSub;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
