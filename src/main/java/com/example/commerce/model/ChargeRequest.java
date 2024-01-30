package com.example.commerce.model;

import lombok.Data;

@Data
public class ChargeRequest {
    private String description;
    private Double amount;
    private Currency currency;
    private String stripeEmail;
    private String stripeToken;

    public enum Currency {
        EUR, USD, VND;
    }
}
