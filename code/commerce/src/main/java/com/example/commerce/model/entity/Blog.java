package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "blog")
@Data
public class Blog {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "category_id")
    private Long categoryId;

    @Column(name = "created_time")
    private String createdTime;

    @Column(name = "created_day")
    private Integer createdDay;

    @Column(name = "created_month")
    private String createdMonth;

    @Column(name = "image")
    private String image;

    @Column(name = "deleted")
    private Boolean deleted;
}
