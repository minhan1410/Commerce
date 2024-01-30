package com.example.commerce.model.dto;

import com.example.commerce.model.entity.Notification;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class NotificationDTO {
    private Long id;
    private Long fromUser;
    private String message;
    private LocalDateTime createdAt;
    private Boolean isSeen;
    private UserDTO fromUserDTO;

    public static Notification mapperEntity(NotificationDTO notificationDTO) {
        return Notification.builder()
                .id(notificationDTO.getId())
                .fromUser(notificationDTO.getFromUser())
                .message(notificationDTO.getMessage())
                .createdAt(notificationDTO.getCreatedAt())
                .isSeen(notificationDTO.getIsSeen())
                .build();
    }
}
