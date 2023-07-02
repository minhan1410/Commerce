package com.example.commerce.service;

import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.model.entity.User;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Locale;

public interface UserService extends UserDetailsService {
    void signUp(UserDTO userDTO, Model model, Locale locale, String url);

    Boolean createUserProvider(CustomOAuth2User oAuth2User, String provider);

    void veryficationCode(String code, RedirectAttributes redirectAttributes, Locale locale);

    void getCurrentUser(Model model);


    UserDTO getCurrentUser();

    UserDTO getById(Long id);

    void getById(Long id, Model model);

    User updateMember(UserDTO userDTO);

    List<UserDTO> getAllUsers();

    List<UserDTO> getAllAdmin();
}
