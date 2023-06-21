package com.example.commerce.service.impl;

import com.example.commerce.constants.TelegramNotificationType;
import com.example.commerce.service.TelegramNotificationService;
import lombok.experimental.Accessors;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.telegram.telegrambots.bots.TelegramLongPollingBot;
import org.telegram.telegrambots.meta.api.methods.send.SendMessage;
import org.telegram.telegrambots.meta.api.objects.Update;
import org.telegram.telegrambots.meta.exceptions.TelegramApiException;

@Service
@Accessors(chain = true)
public class TelegramNotificationServiceImpl extends TelegramLongPollingBot implements TelegramNotificationService {
    @Value("${telegram.bot.token}")
    private String botToken;


    @Override
    public void sendMessage(TelegramNotificationType type, String messageText) {
        SendMessage message = new SendMessage();
        message.setChatId(type.getChatId());
        message.setText(messageText);

        try {
            execute(message);
        } catch (TelegramApiException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void onUpdateReceived(Update update) {
    }

    @Override
    public String getBotUsername() {
        return "Ecommerce Bot";
    }

    @Override
    public String getBotToken() {
        return botToken;
    }
}
