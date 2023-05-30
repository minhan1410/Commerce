package com.example.commerce.model.dto;

import com.example.commerce.model.entity.Message;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class MessageDTO {
    private Long id;
    private Long fromUser;
    private String message;
    private LocalDateTime createdAt;
    private Boolean isSeen;
    private UserDTO fromUserDTO;

    public static Message mapperEntity(MessageDTO messageDTO) {
        return Message.builder()
                .id(messageDTO.getId())
                .fromUser(messageDTO.getFromUser())
                .message(messageDTO.getMessage())
                .createdAt(messageDTO.getCreatedAt())
                .isSeen(messageDTO.getIsSeen())
                .build();
    }
}