package com.example.commerce.model.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Data
public class User {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
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
    private Date createdTime;

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
    private Date otpRequestedTime;

    @Column(name = "verification_code")
    private String verificationCode;

    @Column(name = "verification_code_expiry")
    private Date verificationCodeExpiry;

    @Column(name = "deleted")
    private Boolean deleted;

    public User create(String password, String role, String verificationCode) {
        this.password = password;
        this.role = role;
        this.verificationCode = verificationCode;
        this.verificationCodeExpiry = new Date();
        return this;
    }

    public User updateVerificationCodeExpiry() {
        this.verificationCodeExpiry = new Date();
        return this;
    }

    public User veryficationCode() {
        this.enabled = true;
        this.verificationCode = null;
        this.verificationCodeExpiry = null;
        return this;
    }
}
