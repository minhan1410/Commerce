package com.example.commerce.controller.error;

import org.springframework.security.web.authentication.rememberme.CookieTheftException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyExceptionHandler {
    @ExceptionHandler(CookieTheftException.class)
    public String cookieTheftException() {
        return "login";
    }
}
