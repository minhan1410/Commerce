package com.example.commerce.service.impl;

import com.example.commerce.constants.Provider;
import com.example.commerce.model.custom.CustomOAuth2User;
import com.example.commerce.model.custom.CustomUserDetails;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.model.entity.User;
import com.example.commerce.repository.UserRepository;
import com.example.commerce.service.MailService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import net.bytebuddy.utility.RandomString;
import org.modelmapper.ModelMapper;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.Locale;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl extends DefaultOAuth2UserService implements UserService {
    private final UserRepository userRepository;
    private final MessageSource messageSource;
    private final ModelMapper mapper;
    private final PasswordEncoder passwordEncoder;
    private final MailService mailService;
    private final Scheduler scheduler;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return new CustomUserDetails(userRepository.findByMail(username).orElseThrow(() -> new UsernameNotFoundException(username)));
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User user = super.loadUser(userRequest);
        String username = user.getAttribute("email");
        return new CustomOAuth2User(user, userRepository.findByMail(username).orElseThrow(() -> new UsernameNotFoundException(username)));
    }

    @Override
    @Transactional
    public void signUp(UserDTO userDTO, Model model, Locale locale, String url) {
        Optional<User> findMail = userRepository.findByMail(userDTO.getMail());
        if (findMail.isPresent() && findMail.get().getVerificationCodeExpiry() == null) {
            model.addAttribute("err", messageSource.getMessage("existedMail", null, "default message", locale));
            return;
        }
        String verificationCode = RandomString.make(20);
        User user = findMail.isPresent() && findMail.get().getVerificationCodeExpiry() != null ? findMail.get().updateVerificationCodeExpiry() : mapper.map(userDTO, User.class).createUserLocal(passwordEncoder.encode(userDTO.getPassword()), verificationCode);
        userRepository.save(user);

//        send email
        JobDetail jobDetail = mailService.buildJobDetailRegister(userDTO.getName(), userDTO.getMail(), url + "/verify?code=" + verificationCode);
        Trigger trigger = mailService.buildJobTriggerRegister(jobDetail);
        try {
            scheduler.scheduleJob(jobDetail, trigger);
            model.addAttribute("mess", messageSource.getMessage("verificationCode", null, "default message", locale));
        } catch (SchedulerException e) {
            model.addAttribute("err", messageSource.getMessage("Khong gui duoc mail", null, null, locale));
        }
    }

    @Override
    @Transactional
    public Boolean createUserProvider(CustomOAuth2User oAuth2User, String provider) {
        Optional<User> findMail = userRepository.findByMail(oAuth2User.getEmail());
        if (Boolean.TRUE.equals(findMail.isPresent() && findMail.get().getEnabled()) && !findMail.get().getAuthProvider().equals(Provider.valueOf(provider.toUpperCase()))) {
            return false;
        }
        if (findMail.isEmpty()) {
            userRepository.save(new User().createUserProvider(oAuth2User, provider));
        }
        return true;
    }

    @Override
    @Transactional
    public void veryficationCode(String code, Model model, Locale locale) {
        Optional<User> findCode = userRepository.findByVerificationCode(code);
        if (findCode.isEmpty()) {
            model.addAttribute("mess", messageSource.getMessage("Code k ton tai", null, "default message", locale));
            return;
        }
        User user = findCode.get();
        if (System.currentTimeMillis() > user.getVerificationCodeExpiry().getTime() + 300000L) { // wa 5p k xac thuc
            model.addAttribute("Qua thoi gin xac thuc", messageSource.getMessage("signUpSuccess", null, "default message", locale));
            return;
        }
        userRepository.save(user.veryficationCode());
        model.addAttribute("mess", messageSource.getMessage("signUpSuccess", null, "default message", locale));
    }

    @Override
    public void getCurrentUser(Model model) {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = principal instanceof String ? new User()
                : principal instanceof CustomUserDetails ? ((CustomUserDetails) principal).getUser()
                : ((CustomOAuth2User) principal).getUser();
        model.addAttribute("id", user.getId());
        model.addAttribute("user", user);
    }
}
