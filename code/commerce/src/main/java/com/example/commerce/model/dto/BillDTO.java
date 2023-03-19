package com.example.commerce.model.dto;

import lombok.Data;

@Data
public class BillDTO {
    private Long id;
    private UserDTO user;
    private CartDTO cartItems;
    private Long priceTotal;
    private Long receiverName;
    private Long shippingAddress;
    private Long phoneNumber;
    private Long createTime;
    private Long confirmTime;
    private Long deliveryTime;
    private Long receivedTime;
    private String status;
    private Boolean deleted = false;

}
