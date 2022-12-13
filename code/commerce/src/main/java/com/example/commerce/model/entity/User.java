package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Data
public class User {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "mail", unique = true)
    private String mail;

    @Column(name = "password")
    private String password;

    @Column(name = "name")
    private String name;

    @Column(name = "phone")
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "state")
    private String state;

    @Column(name = "city")
    private String city;

    @Column(name = "country_id")
    private Integer countryId;

    @Column(name = "created_time")
    private LocalDateTime createdTime;

    @Column(name = "role")
    private String role;

    @Column(name = "enabled")
    private Boolean enabled;

    @Column(name = "auth_provider")
    private String authProvider;

    @Column(name = "postal_code")
    private Integer postalCode;

    @Column(name = "avatar")
    private String avatar;

    @Column(name = "one_time_password")
    private String oneTimePassword;

    @Column(name = "otp_requested_time")
    private LocalDateTime otpRequestedTime;

    @Column(name = "deleted")
    private Boolean deleted;
}
