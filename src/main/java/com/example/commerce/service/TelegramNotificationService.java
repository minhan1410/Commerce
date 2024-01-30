package com.example.commerce.service;

import com.example.commerce.constants.TelegramNotificationType;

public interface TelegramNotificationService {
    void sendMessage(TelegramNotificationType type, String errorMessage);
}
