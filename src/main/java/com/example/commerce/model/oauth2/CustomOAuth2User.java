package com.example.commerce.model.oauth2;

import com.example.commerce.constants.Role;
import com.example.commerce.model.entity.User;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.Map;

@RequiredArgsConstructor
@Getter
@Setter
@AllArgsConstructor
public class CustomOAuth2User implements OAuth2User {
    private final OAuth2User oauth2User;
    private User user;

    @Override
    public Map<String, Object> getAttributes() {
        return oauth2User.getAttributes();
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(new SimpleGrantedAuthority(user == null ? Role.USER.name() : user.getRole().name()));
    }

    @Override
    public String getName() {
        return oauth2User.getAttribute("name");
    }

    public String getEmail() {
        return oauth2User.getAttribute("email");
    }

    public String getAvatarFb() {
        return ((LinkedHashMap<String, LinkedHashMap<String, String>>) oauth2User.getAttribute("picture")).get("data").get("url");
    }

    public String getAvatarGoogle() {
        return oauth2User.getAttribute("picture");
    }
}
