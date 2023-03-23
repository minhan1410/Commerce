package com.example.commerce.model.entity;

import com.example.commerce.constants.BillStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "bill")
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Bill {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "cart_id")
    private Long cartId;

    @Column(name = "coupon_id")
    private Long couponId;

    @Column(name = "total_cart")
    private Integer totalCart;

    @Column(name = "price_total")
    private Double priceTotal;

    @Column(name = "receiver_name")
    private String receiverName;

    @Column(name = "shipping_address")
    private String shippingAddress;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "confirm_time")
    private Date confirmTime;

    @Column(name = "delivery_time")
    private Date deliveryTime;

    @Column(name = "received_time")
    private Date receivedTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "status")
    private BillStatus status;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
