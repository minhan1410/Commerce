package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "categories")
@Data
public class Categories {
    @Id
    @Column(name = "id_cate")
    private Long idCate;

    @Column(name = "type")
    private String type;

    @Column(name = "deleted")
    private Boolean deleted;
}
