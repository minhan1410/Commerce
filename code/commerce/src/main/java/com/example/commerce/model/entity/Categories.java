package com.example.commerce.model.entity;

import com.example.commerce.model.dto.CategoriesDTO;
import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "categories")
@Data
public class Categories {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "type", unique = true)
    private String type;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public Categories update(CategoriesDTO dto) {
        this.type = dto.getType();
        return this;
    }

    public Categories delete() {
        this.deleted = true;
        return this;
    }
}
