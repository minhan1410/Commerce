package com.example.commerce.model.dto;

import com.example.commerce.constants.BillStatus;
import lombok.Data;

import java.util.Date;

@Data
public class BillDTO {
    private Long id;
    private UserDTO user;
    private CartDTO cart;
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
