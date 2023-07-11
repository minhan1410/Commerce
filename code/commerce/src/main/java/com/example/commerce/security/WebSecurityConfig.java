package com.example.commerce.security;

import com.example.commerce.config.SimpleAuthenticationSuccessHandler;
import com.example.commerce.constants.Role;
import com.example.commerce.controller.error.CustomAuthenticationFailureHandler;
import com.example.commerce.service.impl.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.annotation.web.configurers.RememberMeConfigurer;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserServiceImpl userService;
    private final PasswordEncoder passwordEncoder;
    private final DataSource dataSource;
    private final SimpleAuthenticationSuccessHandler successHandler;

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {
        // Cấu hình AuthenticationManagerBuilder
        auth.eraseCredentials(false) // Ngăn Spring Security xoá thông tin đăng nhập khi kết thúc phiên làm việc
                .userDetailsService(userService)
                .passwordEncoder(passwordEncoder);
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.csrf().disable()
                .authorizeRequests()
                .antMatchers("/", "/home", "/search", "/login/**", "/sign-up/**", "/oauth/**", "/verify",
                        "/product/**", "/product-detail/**", "/blog/**", "/blog-detail/**", "/about", "/contact",
                        "/review-ws/**", "/auto-chat", "/send-help").permitAll()
                .antMatchers("/admin/**").hasAuthority(Role.ADMIN.name())
                .anyRequest().authenticated()

                .and().formLogin().loginPage("/login").usernameParameter("mail").successHandler(successHandler).failureHandler(new CustomAuthenticationFailureHandler())
                .and().logout().logoutUrl("/logout").logoutSuccessUrl("/login").deleteCookies("remember-me")

                .and().oauth2Login().loginPage("/login")
                .userInfoEndpoint().userService(userService).and()
                .successHandler(successHandler)

                .and().rememberMe().userDetailsService(userService).tokenRepository(persistentTokenRepository());
    }

    @Override
    public void configure(WebSecurity web) {
        web.ignoring().antMatchers("/css/**", "/fonts/**", "/images/**", "/js/**", "/vendor/**", "/error");
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
        JdbcTokenRepositoryImpl tokenRepo = new JdbcTokenRepositoryImpl();
        tokenRepo.setDataSource(dataSource);
        return tokenRepo;
    }

    @Bean
    public RememberMeConfigurer persistentTokenRememberMeConfigurer() {
        RememberMeConfigurer rememberMeConfigurer = new RememberMeConfigurer();
        rememberMeConfigurer.tokenRepository(persistentTokenRepository());
        rememberMeConfigurer.tokenValiditySeconds(2_592_000); // Thời gian hiệu lực của cookie Remember Me (30 ngày)
        rememberMeConfigurer.useSecureCookie(false); // Có thể điều chỉnh theo nhu cầu
        return rememberMeConfigurer;
    }
}
