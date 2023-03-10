package com.example.commerce.model.entity;

import com.example.commerce.model.dto.BlogDTO;
import lombok.Data;

import javax.persistence.*;
import java.util.Objects;

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

    public Blog update(BlogDTO dto) {
        if (Objects.nonNull(dto.getImage())) {
            this.image = dto.getImage();
        }
        this.title = dto.getTitle();
        this.content = dto.getContent();
        this.categoryBlogId = dto.getCategoryBlogId();
        this.createdTime = dto.getCreatedTime();
        this.createdDay = dto.getCreatedDay();
        this.createdMonth = dto.getCreatedMonth();
        return this;
    }
}
