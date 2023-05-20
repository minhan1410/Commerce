package com.example.commerce.model.dto;

import com.example.commerce.constants.BillStatus;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
public class BillDTO {
    private Long id;
    private Long userId;
    private Long cartId;
    private CartDTO cart;
    private List<CartItemDTO> cartItem;
    private Long couponId;
    private CouponDTO coupon;
    private Integer totalCart;
    private Double priceTotal;
    private String receiverName;
    private String shippingAddress;
    private String phoneNumber;
    private Date createTime;
    private Date confirmTime;
    private Date deliveryTime;
    private Date receivedTime;
    private BillStatus status;
    private Boolean deleted = false;

}
