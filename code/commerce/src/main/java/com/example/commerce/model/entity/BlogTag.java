package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "blog_tag")
@Data
public class BlogTag {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "blog_id")
    private Long blogId;

    @Column(name = "tag_id")
    private Integer tagId;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
