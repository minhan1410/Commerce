package com.example.commerce.service.impl;

import com.example.commerce.model.dto.NotificationDTO;
import com.example.commerce.model.entity.Notification;
import com.example.commerce.repository.NotificationRepository;
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
    private final NotificationRepository notificationRepository;
    private final ModelMapper mapper;

    @Override
    public List<NotificationDTO> getAllMessageIsSeenFalse() {
        return notificationRepository.getByIsSeenFalseOrderByCreatedAtDesc().stream().map(message -> {
            NotificationDTO map = mapper.map(message, NotificationDTO.class);
            map.setFromUserDTO(userService.getById(message.getFromUser()));
            return map;
        }).toList();
    }

    @Override
    @Transactional
    public void viewMessage(Long id) {
        notificationRepository.findById(id).ifPresent(message -> {
            message.setIsSeen(true);
            notificationRepository.save(message);
        });
    }

    @Override
    @Transactional
    public void viewAll() {
        notificationRepository.getByIsSeenFalseOrderByCreatedAtDesc().forEach(message -> {
            message.setIsSeen(true);
            notificationRepository.save(message);
        });
    }

    @Override
    public void deleteByUser(Long id) {
        List<Notification> getUser = notificationRepository.getByIsSeenFalseOrderByCreatedAtDesc();
        getUser.forEach(notification -> notification.setIsSeen(true));
        notificationRepository.saveAll(getUser);
    }
}
