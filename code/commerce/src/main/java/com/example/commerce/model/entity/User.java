package com.example.commerce.model.entity;

import com.example.commerce.constants.Provider;
import com.example.commerce.constants.Role;
import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.dto.UserDTO;
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

    @Column(name = "created_time")
    private Date createdTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "role")
    private Role role;

    @Column(name = "enabled")
    private Boolean enabled;

    @Enumerated(EnumType.STRING)
    @Column(name = "auth_provider")
    private Provider authProvider;

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

    @Column(name = "deleted", columnDefinition = "boolean default false")
    private Boolean deleted;

    public User createUserLocal(String password, String verificationCode) {
        this.password = password;
        this.role = Role.USER;
        this.authProvider = Provider.LOCAL;
        this.verificationCode = verificationCode;
        this.verificationCodeExpiry = new Date();
        this.avatar = "https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png";
        return this;
    }

    public User createUserProvider(CustomOAuth2User oAuth2User, String provider) {
        this.mail = oAuth2User.getEmail();
        this.name = oAuth2User.getName();
        this.role = Role.USER;
        this.authProvider = Provider.valueOf(provider.toUpperCase());
        this.enabled = true;
        this.avatar = provider.equals("facebook") ? oAuth2User.getAvatarFb() : oAuth2User.getAvatarGoogle();
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

    public User update(UserDTO dto) {
        if (dto.getAvatar() != null) {
            this.avatar = dto.getAvatar();
        }
        this.name = dto.getName();
        this.mail = dto.getMail();
        this.phone = dto.getPhone();
        this.address = dto.getAddress();
        this.state = dto.getState();
        this.city = dto.getCity();
        this.postalCode = dto.getPostalCode();
        return this;
    }
}
