package com.example.commerce.service;

import com.example.commerce.model.dto.MessageDTO;

import java.util.List;

public interface MessageService {
    List<MessageDTO> getAllMessageIsSeenFalse();

    void viewMessage(Long id);

    void viewAll();
}