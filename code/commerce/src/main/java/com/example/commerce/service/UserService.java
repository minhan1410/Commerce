package com.example.commerce.service;

import com.example.commerce.model.CustomOAuth2User;
import com.example.commerce.model.dto.UserDTO;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.ui.Model;

import java.util.Locale;

public interface UserService extends UserDetailsService {
    void signUp(UserDTO userDTO, Model model, Locale locale, String url);

    Boolean createUserProvider(CustomOAuth2User oAuth2User, String provider);

    void veryficationCode(String code, Model model, Locale locale);
}
