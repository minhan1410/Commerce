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
    public String exceptionHandler(Exception e) {
        telegramNotificationService.sendMessage(TelegramNotificationType.ERROR, e.getMessage());
        return "/error/notFound";
    }
}
