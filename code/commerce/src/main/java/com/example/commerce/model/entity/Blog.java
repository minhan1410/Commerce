package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "blog")
@Data
public class Blog {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "title")
    private String title;

    @Column(name = "content")
    private String content;

    @Column(name = "category_blog_id")
    private Long categoryBlogId;

    @Column(name = "created_time")
    private String createdTime;

    @Column(name = "created_day")
    private Integer createdDay;

    @Column(name = "created_month")
    private String createdMonth;

    @Column(name = "image")
    private String image;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
