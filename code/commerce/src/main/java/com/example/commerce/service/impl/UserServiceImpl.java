package com.example.commerce.service.impl;

import com.example.commerce.model.CustomUserDetails;
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
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Locale;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
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
    @Transactional
    public void signUp(UserDTO userDTO, Model model, Locale locale, String url) {
        Optional<User> findMail = userRepository.findByMail(userDTO.getMail());
        if (findMail.isPresent() && findMail.get().getVerificationCodeExpiry() == null) {
            model.addAttribute("err", messageSource.getMessage("existedMail", null, "default message", locale));
            return;
        }
        String verificationCode = RandomString.make(20);
        User user = findMail.isPresent() && findMail.get().getVerificationCodeExpiry() != null
                ? mapper.map(userDTO, User.class).create(passwordEncoder.encode(userDTO.getPassword()), "ROLE_USER", verificationCode)
                : findMail.get().updateVerificationCodeExpiry();
        userRepository.save(user);

//        send email
        ZonedDateTime dateTime = ZonedDateTime.of(LocalDateTime.now(), ZoneId.of("Asia/Saigon"));
        JobDetail jobDetail = mailService.buildJobDetailRegister(userDTO.getName(), userDTO.getMail(), url + "/verify?code=" + verificationCode);
        Trigger trigger = mailService.buildJobTriggerRegister(jobDetail, dateTime);
        try {
            scheduler.scheduleJob(jobDetail, trigger);
            model.addAttribute("mess", messageSource.getMessage("verificationCode", null, "default message", locale));
        } catch (SchedulerException e) {
            model.addAttribute("err", messageSource.getMessage("Khong gui duoc mail", null, null, locale));
        }
    }

    @Override
    @Transactional
    public Boolean veryficationCode(String code, Model model, Locale locale) {
        Optional<User> findCode = userRepository.findByVerificationCode(code);
        if (findCode.isEmpty()) {
            //        model.addAttribute("mess", messageSource.getMessage("signUpSuccess", null, "default message", locale));
            return false;
        }
        User user = findCode.get();
        if (System.currentTimeMillis() > user.getVerificationCodeExpiry().getTime() + 300000L) { // wa 5p k xac thuc
//        model.addAttribute("mess", messageSource.getMessage("signUpSuccess", null, "default message", locale));
            return false;
        }
        userRepository.save(user.veryficationCode());
        model.addAttribute("mess", messageSource.getMessage("signUpSuccess", null, "default message", locale));
        return true;
    }
}
