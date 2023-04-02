package com.example.commerce.config;

import com.example.commerce.constants.Role;
import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.custom.CustomUserDetails;
import com.example.commerce.service.impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.client.authentication.OAuth2AuthenticationToken;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Collection;

@Component
@RequiredArgsConstructor
public class SimpleAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    private final UserServiceImpl userService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        Object principal = authentication.getPrincipal();
        if (principal instanceof CustomUserDetails) {
            Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
            authorities.forEach(authority -> {
                if (authority.getAuthority().equals(Role.ADMIN.name())) {
                    try {
                        redirectStrategy.sendRedirect(request, response, "/admin");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                } else if (authority.getAuthority().equals(Role.USER.name())) {
                    try {
                        redirectStrategy.sendRedirect(request, response, "/home");
                    } catch (IOException e) {
                        throw new RuntimeException(e);
                    }
                } else {
                    throw new IllegalStateException();
                }
            });
        } else if (principal instanceof CustomOAuth2User) {
            CustomOAuth2User oauthUser = (CustomOAuth2User) principal;
            String provider = ((OAuth2AuthenticationToken) authentication).getAuthorizedClientRegistrationId();
            if (Boolean.TRUE.equals(userService.createUserProvider(oauthUser, provider))) {
                redirectStrategy.sendRedirect(request, response, "/home");
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("err", "Existed Mail");
                redirectStrategy.sendRedirect(request, response, "/login");
            }
        }

    }
}
