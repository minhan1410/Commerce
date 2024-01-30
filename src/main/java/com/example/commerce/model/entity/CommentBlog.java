package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "comment_blog")
@Data
public class CommentBlog {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "comment")
    private String comment;

    @Column(name = "reviewer_id")
    private Long reviewerId;

    @Column(name = "blog_id")
    private Long blogId;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
