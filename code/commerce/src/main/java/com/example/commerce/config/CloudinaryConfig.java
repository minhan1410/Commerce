package com.example.commerce.config;

import com.cloudinary.Cloudinary;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Map;

@Configuration
public class CloudinaryConfig {
    @Bean
    public Cloudinary cloudinary() {
        return new Cloudinary(Map.of(
                "cloud_name", "dpvehgfmo",
                "api_key", "666415669279467",
                "api_secret", "3tgmwjhQ9ADLqPhkzx3Cn7J6uT4",
                "secure", true
        ));
    }
}