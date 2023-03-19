package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "bill")
@Data
public class Bill {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "cart_items_id")
    private Long cartItemsId;

    @Column(name = "coupon_id")
    private Long couponId;

    @Column(name = "price_total")
    private Long priceTotal;

    @Column(name = "receiver_name")
    private Long receiverName;

    @Column(name = "shipping_address")
    private Long shippingAddress;

    @Column(name = "phone_number")
    private Long phoneNumber;

    @Column(name = "create_time")
    private Long createTime;

    @Column(name = "confirm_time")
    private Long confirmTime;

    @Column(name = "delivery_time")
    private Long deliveryTime;

    @Column(name = "received_time")
    private Long receivedTime;

    @Column(name = "status")
    private String status;

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;
}
