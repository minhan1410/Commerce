package com.example.commerce.model.dto;

import com.example.commerce.model.entity.Product;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.util.Objects;

@Data
public class ProductDTO {
    private Long id;
    @NotBlank(message = "name not bank")
    private String name;
    private Long price;
    private String description;
    private Long categoriesId;
    private CategoriesDTO categories;
    private String imgMain;
    private String imgHover;
    private String imgSub;
    private String material;
    private String color;
    private String size;
    private Integer quantity;
    private Boolean deleted = false;
    @NotNull(message = "imageMain not null")
    private MultipartFile imageMain;
    @NotNull(message = "imageHover not null")
    private MultipartFile imageHover;
    @NotNull(message = "imageSub not null")
    private MultipartFile imageSub;

    public ProductDTO update(Product product) {
        if (!Objects.equals(this.imgMain, product.getImgMain())) {
            this.imgMain = product.getImgMain();
        }
        if (!Objects.equals(this.imgSub, product.getImgSub())) {
            this.imgSub = product.getImgSub();
        }
        if (!Objects.equals(this.imgHover, product.getImgHover())) {
            this.imgHover = product.getImgHover();
        }
        if (!Objects.equals(this.name, product.getName())) {
            this.name = product.getName();
        }
        if (!Objects.equals(this.categoriesId, product.getCategoriesId())) {
            this.categoriesId = product.getCategoriesId();
            this.categories = null;
        }
        if (!Objects.equals(this.material, product.getMaterial())) {
            this.material = product.getMaterial();
        }
        if (!Objects.equals(this.color, product.getColor())) {
            this.color = product.getColor();
        }
        if (!Objects.equals(this.size, product.getSize())) {
            this.size = product.getSize();
        }
        if (!Objects.equals(this.description, product.getDescription())) {
            this.description = product.getDescription();
        }
        if (!Objects.equals(this.price, product.getPrice())) {
            this.price = product.getPrice();
        }
        if (!Objects.equals(this.quantity, product.getQuantity())) {
            this.quantity = product.getQuantity();
        }
        return this;
    }
}
