package com.example.commerce.controller.error;

import com.example.commerce.constants.TelegramNotificationType;
import com.example.commerce.service.impl.TelegramNotificationServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class MyErrorController implements ErrorController {
    private final TelegramNotificationServiceImpl telegramNotificationService;

    @RequestMapping("/error")
    public String handleError(HttpServletRequest request) {
        Integer status = (Integer) request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        String messageError = (String) request.getAttribute(RequestDispatcher.ERROR_EXCEPTION);
        String urlError = (String) request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);

        if (status != null) {
            if (status != HttpStatus.NOT_FOUND.value())
                telegramNotificationService.sendMessage(TelegramNotificationType.ERROR, String.format("STATUS: %s\nURL ERROR: %s\nMESSAGE: %s", status, urlError, messageError));

            if (status == HttpStatus.NOT_FOUND.value()) {
                return "/error/notFound";
            } else if (status == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error-500";
            }
        }
        return "error";
    }
}
