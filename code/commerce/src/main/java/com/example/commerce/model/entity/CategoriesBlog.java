package com.example.commerce.model.entity;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "categories_blog")
@Data
public class CategoriesBlog {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "type")
    private String type;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public CategoriesBlog update(CategoriesBlogDTO categoriesBlogDTO) {
        this.type = categoriesBlogDTO.getType();
        return this;
    }
}
