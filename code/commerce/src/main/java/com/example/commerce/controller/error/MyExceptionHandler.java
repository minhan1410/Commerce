package com.example.commerce.controller.error;

import org.springframework.security.web.authentication.rememberme.CookieTheftException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class MyExceptionHandler {
    @ExceptionHandler(value = {CookieTheftException.class, IllegalStateException.class})
    public String cookieTheftException() {
        return "login";
    }
}
