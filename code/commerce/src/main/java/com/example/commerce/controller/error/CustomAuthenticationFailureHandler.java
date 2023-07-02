package com.example.commerce.controller.error;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException {
        String errorMessage = exception instanceof BadCredentialsException ? "Invalid username or password" : "Please check your email to verify your account";
        request.getSession().setAttribute("errorMessage", errorMessage);
        getRedirectStrategy().sendRedirect(request, response, "/login?error=true");
    }
}

