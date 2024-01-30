package com.example.commerce.controller.error;

import com.example.commerce.model.entity.User;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Optional;

@RequiredArgsConstructor
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler {
    private final UserService userService;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException {
        String errorMessage = null;
        String mail = request.getParameter("mail");
        Optional<User> optional = userService.findUserByMail(mail);
        if (optional.isEmpty()) {
            errorMessage = "Invalid username";
        } else if (exception instanceof BadCredentialsException) {
            errorMessage = "Invalid password";
        } else if (exception instanceof DisabledException) {
            if (optional.get().getDeleted()) {
                errorMessage = "Account is disabled";
            } else {
                errorMessage = "Please check your email to verify your account";
            }
        }

        request.getSession().setAttribute("errorMessage", errorMessage);
        getRedirectStrategy().sendRedirect(request, response, "/login?error=true");
    }
}

