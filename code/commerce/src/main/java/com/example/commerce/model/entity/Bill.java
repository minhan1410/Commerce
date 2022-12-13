package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Entity
@Table(name = "bill")
@Data
public class Bill {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "bill_date")
    private LocalDateTime billDate;

    @Column(name = "price_total")
    private Long priceTotal;

    @Column(name = "discount_percent")
    private Integer discountPercent;

    @Column(name = "buyer_id")
    private Long buyerId;

    @Column(name = "status")
    private String status;

    @Column(name = "pay")
    private String pay;

    @Column(name = "deleted")
    private Boolean deleted;
}
