package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "tag")
@Data
public class Tag {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "type")
    private String type;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
