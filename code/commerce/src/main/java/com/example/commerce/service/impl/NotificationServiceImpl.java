package com.example.commerce.service.impl;

import com.example.commerce.model.dto.NotificationDTO;
import com.example.commerce.repository.MessageRepository;
import com.example.commerce.service.NotificationService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {
    private final UserService userService;
    private final MessageRepository messageRepository;
    private final ModelMapper mapper;

    @Override
    public List<NotificationDTO> getAllMessageIsSeenFalse() {
        return messageRepository.getByIsSeenFalseOrderByCreatedAtDesc().stream().map(message -> {
            NotificationDTO map = mapper.map(message, NotificationDTO.class);
            map.setFromUserDTO(userService.getById(message.getFromUser()));
            return map;
        }).toList();
    }

    @Override
    @Transactional
    public void viewMessage(Long id) {
        messageRepository.findById(id).ifPresent(message -> {
            message.setIsSeen(true);
            messageRepository.save(message);
        });
    }

    @Override
    @Transactional
    public void viewAll() {
        messageRepository.getByIsSeenFalseOrderByCreatedAtDesc().forEach(message -> {
            message.setIsSeen(true);
            messageRepository.save(message);
        });
    }
}
