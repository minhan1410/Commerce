package com.example.commerce.controller.error;

import com.example.commerce.constants.TelegramNotificationType;
import com.example.commerce.service.impl.TelegramNotificationServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.web.authentication.rememberme.CookieTheftException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
@RequiredArgsConstructor
public class MyExceptionHandler {
    private final TelegramNotificationServiceImpl telegramNotificationService;

    @ExceptionHandler(value = {CookieTheftException.class, IllegalStateException.class})
    public String cookieTheftException() {
        return "login";
    }

    @ExceptionHandler(value = {Exception.class})
    public void exceptionHandler(Exception e) {
        String exceptionName = e.getClass().getSimpleName();
        String errorMessage = e.getMessage();
        telegramNotificationService.sendMessage(TelegramNotificationType.ERROR, "Exception: " + exceptionName + "\nMessage: " + errorMessage);
    }
}
