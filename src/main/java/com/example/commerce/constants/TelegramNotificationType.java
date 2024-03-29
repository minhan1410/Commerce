package com.example.commerce.constants;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Getter
public enum TelegramNotificationType {
    ORDER("-874498960"),
    ERROR("-969402222"),
    CONTACT("-948337498");

    private String chatId;
}