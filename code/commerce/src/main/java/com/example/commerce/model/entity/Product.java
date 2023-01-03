package com.example.commerce.model.entity;

import com.example.commerce.model.dto.ProductDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name = "product")
@Data
@NoArgsConstructor
public class Product {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "name", unique = true)
    private String name;

    @Column(name = "price")
    private Long price;

    @Column(name = "description")
    private String description;

    @Column(name = "categories_id")
    private Long categoriesId;

    @Column(name = "img_main")
    private String imgMain;

    @Column(name = "img_hover")
    private String imgHover;

    @Column(name = "img_sub")
    private String imgSub;
    @Column(name = "weight")
    private Double weight;

    @Column(name = "length")
    private Long length;

    @Column(name = "width")
    private Long width;

    @Column(name = "height")
    private Long height;

    @Column(name = "material")
    private String material;

    @Column(name = "colors")
    private String colors;

    @Column(name = "sizes")
    private String sizes;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public Product update(ProductDTO dto) {
        if (Objects.nonNull(dto.getImgMain())) {
            this.imgMain = dto.getImgMain();
        }
        if (Objects.nonNull(dto.getImgSub())) {
            this.imgSub = dto.getImgSub();
        }
        if (Objects.nonNull(dto.getImgHover())) {
            this.imgHover = dto.getImgHover();
        }
        this.name = dto.getName();
        this.categoriesId = dto.getCategoriesId();
        this.weight = dto.getWeight();
        this.length = dto.getLength();
        this.width = dto.getWidth();
        this.height = dto.getHeight();
        this.material = dto.getMaterial();
        this.colors = dto.getColors();
        this.sizes = dto.getSizes();
        this.description = dto.getDescription();
        this.price = dto.getPrice();
        return this;
    }

    public Product delete() {
        this.deleted = true;
        return this;
    }
}
