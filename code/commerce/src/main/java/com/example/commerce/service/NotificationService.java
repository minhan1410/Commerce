package com.example.commerce.service;

import com.example.commerce.model.dto.NotificationDTO;

import java.util.List;

public interface NotificationService {
    List<NotificationDTO> getAllMessageIsSeenFalse();

    void viewMessage(Long id);

    void viewAll();
}