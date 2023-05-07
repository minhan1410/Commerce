package com.example.commerce.config;

import com.example.commerce.constants.Role;
import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.custom.CustomUserDetails;
import com.example.commerce.service.impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Component
@RequiredArgsConstructor
public class SimpleAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private final UserServiceImpl userService;

    private final RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException {
        HttpSession session = request.getSession();
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUserDetails userDetails) {
            if (userDetails.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals(Role.ADMIN.name()))) {
                redirect("/admin", request, response);
                return;
            } else if (userDetails.getAuthorities().stream().anyMatch(auth -> auth.getAuthority().equals(Role.USER.name()))) {
                redirect("/home", request, response);
                return;
            }
            // Trường hợp không phải user hay admin
            redirect("/login", request, response);
        } else if (principal instanceof CustomOAuth2User oauthUser) {
            String provider = ((OAuth2AuthenticationToken) authentication).getAuthorizedClientRegistrationId();
            if (Boolean.TRUE.equals(userService.createUserProvider(oauthUser, provider))) {
                redirect("/home", request, response);
            } else {
                session.setAttribute("err", "Existed Mail");
                redirect("/login", request, response);
            }
        }
    }

    private void redirect(String redirectUrl, HttpServletRequest request, HttpServletResponse response) throws IOException {
        redirectStrategy.sendRedirect(request, response, redirectUrl);
    }
}
