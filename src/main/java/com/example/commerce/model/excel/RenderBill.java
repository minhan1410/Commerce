package com.example.commerce.model.excel;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class RenderBill {
    private Long id;
    private String emailUser;
    private String cartItem;
    private String discount;
    private Integer totalCart;
    private Double priceTotal;
    private String receiverName;
    private String shippingAddress;
    private String phoneNumber;
    private Date createTime;
    private Date confirmTime;
    private Date deliveryTime;
    private Date receivedTime;
    private String status;
}
