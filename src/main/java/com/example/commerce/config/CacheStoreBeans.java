package com.example.commerce.config;

import com.example.commerce.service.impl.CacheStore;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.http.HttpSession;
import java.util.concurrent.TimeUnit;

@Configuration
public class CacheStoreBeans {
    @Bean
    public CacheStore<String, String> autoChatGPTCache() {
        return new CacheStore<String, String>(1, TimeUnit.HOURS);
    }

    @Bean
    public CacheStore<Long, HttpSession> cartCache() {
        return new CacheStore<Long, HttpSession>(30, TimeUnit.DAYS);
    }
}
