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

    @Column(name = "name")
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

    @Column(name = "material")
    private String material;

    @Column(name = "color")
    private String color;

    @Column(name = "size")
    private String size;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted = false;

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
        this.material = dto.getMaterial();
        this.color = dto.getColor();
        this.size = dto.getSize();
        this.description = dto.getDescription();
        this.price = dto.getPrice();
        this.quantity = dto.getQuantity();
        return this;
    }

    public Product duplicate(ProductDTO dto, ProductDTO productDTO) {
        this.imgMain = !productDTO.getImageMain().isEmpty() ? productDTO.getImgMain() : dto.getImgMain();
        this.imgSub = !productDTO.getImageSub().isEmpty() ? productDTO.getImgSub() : dto.getImgSub();
        this.imgHover = !productDTO.getImageHover().isEmpty() ? productDTO.getImgHover() : dto.getImgHover();
        this.name = dto.getName();
        this.categoriesId = dto.getCategoriesId();
        this.material = dto.getMaterial();
        this.description = dto.getDescription();
        this.price = dto.getPrice();
        this.color = productDTO.getColor();
        this.size = productDTO.getSize();
        this.quantity = productDTO.getQuantity();
        return this;
    }

    public Product delete() {
        this.deleted = true;
        return this;
    }
}
