package com.example.commerce.model.entity;

import com.example.commerce.model.dto.CartItemDTO;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Entity
@Table(name = "cart_item")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "cart_id")
    private Long cartId;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "quantity")
    private Integer quantity;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public static CartItem mapper(CartItemDTO dto) {
        return CartItem.builder()
                .cartId(dto.getCartId())
                .productId(dto.getProduct().getId())
                .quantity(dto.getQuantity())
                .deleted(false).build();
    }
}
