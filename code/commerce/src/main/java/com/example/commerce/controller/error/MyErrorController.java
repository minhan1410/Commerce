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
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        Object messageError = request.getAttribute(RequestDispatcher.ERROR_MESSAGE);
        Object urlError = request.getAttribute(RequestDispatcher.ERROR_REQUEST_URI);

        telegramNotificationService.sendMessage(TelegramNotificationType.ERROR, String.format("STATUS: %s\nURL ERROR: %s\nMESSAGE: %s", status, urlError, messageError));
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());

            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                return "/error/notFound";
            } else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                return "error-500";
            }
        }
        return "error";
    }
}
