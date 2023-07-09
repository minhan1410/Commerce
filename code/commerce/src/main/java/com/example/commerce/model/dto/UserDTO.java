package com.example.commerce.model.dto;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDateTime;

@Data
public class UserDTO {
    private Long id;
    private String mail;
    private String password;
    private String name;
    private String phone;
    private String address;
    private String state;
    private String city;
    private Integer countryId;
    private LocalDateTime createdTime;
    private String role;
    private Byte enabled;
    private String authProvider;
    private String postalCode;
    private String avatar;
    private MultipartFile image;
    private String oneTimePassword;
    private LocalDateTime otpRequestedTime;
    private Boolean deleted = false;

}
