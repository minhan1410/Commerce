package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.MailService;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.quartz.*;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.internet.MimeMessage;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class MailServiceImpl extends QuartzJobBean implements MailService {
    private final JavaMailSender mailSender;
    private final SpringTemplateEngine templateEngine;
    private final Scheduler scheduler;


    @SneakyThrows
    @Override
    public void sendMailCart(Map<Long, CartItemDTO> map, Integer totalOfCart, Double totalPrice, Double totalPriceAfterApplyCoupon, UserDTO currentUser) {
        JobDataMap jobDataMap = new JobDataMap();
        jobDataMap.put("executeInternal", 2);

        jobDataMap.put("cart", map);
        jobDataMap.put("totalOfCart", totalOfCart);
        jobDataMap.put("totalPrice", totalPrice);
        jobDataMap.put("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
        jobDataMap.put("email", currentUser.getMail());
        jobDataMap.put("name", currentUser.getName());

        JobDetail jobDetail = JobBuilder.newJob(MailServiceImpl.class)
                .withIdentity(UUID.randomUUID().toString(), "jobDetail-cart")
                .withDescription("jobDetail cart")
                .usingJobData(jobDataMap)
                .storeDurably()
                .build();

        SimpleTrigger trigger = TriggerBuilder.newTrigger()
                .forJob(jobDetail)
                .withIdentity(jobDetail.getKey().getName(), "trigger-cart")
                .withDescription("trigger cart")
                .startAt(Date.from(ZonedDateTime.of(LocalDateTime.now(), ZoneId.of("Asia/Saigon")).toInstant()))
                .withSchedule(SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
                .build();

        scheduler.scheduleJob(jobDetail, trigger);
    }

    @SneakyThrows
    private void mailCart(JobExecutionContext jobExecutionContext) {
        JobDataMap jobDataMap = jobExecutionContext.getMergedJobDataMap();
//        Map<Long, CartItemDTO> cart = (Map<Long, CartItemDTO>) jobDataMap.get("cart");
//        Integer totalOfCart = (Integer) jobDataMap.get("totalOfCart");
//        Double totalPrice = (Double) jobDataMap.get("totalPrice");
//        Double totalPriceAfterApplyCoupon = (Double) jobDataMap.get("totalPriceAfterApplyCoupon");
        String email = (String) jobDataMap.get("email");

        Context context = new Context();

//        Map<String, Object> props = new HashMap<>();
//        props.put("cart", cart);
//        props.put("totalOfCart", totalOfCart);
//        props.put("totalPrice", totalPrice);
//        props.put("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
//        props.put("email", email);
        context.setVariables(jobDataMap);

        String html = templateEngine.process("/sendMail/cart", context);

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
        helper.setTo(email);
        helper.setSubject("Mua hàng thành công");
        helper.setText(html, true);

        mailSender.send(message);
    }

    @SneakyThrows
    @Override
    public void sendMailRegister(String name, String email, String url) {
        JobDataMap jobDataMap = new JobDataMap();
        jobDataMap.put("executeInternal", 1);

        jobDataMap.put("name", name);
        jobDataMap.put("email", email);
        jobDataMap.put("url", url);

        JobDetail jobDetail = JobBuilder.newJob(MailServiceImpl.class)
                .withIdentity(UUID.randomUUID().toString(), "email-jobs")
                .withDescription("Send Email Job")
                .usingJobData(jobDataMap)
                .storeDurably()
                .build();

        SimpleTrigger trigger = TriggerBuilder.newTrigger()
                .forJob(jobDetail)
                .withIdentity(jobDetail.getKey().getName(), "email-triggers")
                .withDescription("Send Email Trigger")
                .startAt(Date.from(ZonedDateTime.of(LocalDateTime.now(), ZoneId.of("Asia/Saigon")).toInstant()))
                .withSchedule(SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
                .build();

        scheduler.scheduleJob(jobDetail, trigger);
    }

    @SneakyThrows
    private void mailRegister(JobExecutionContext jobExecutionContext) {
        JobDataMap jobDataMap = jobExecutionContext.getMergedJobDataMap();
        String name = jobDataMap.getString("name");
        String email = jobDataMap.getString("email");
        String url = jobDataMap.getString("url");

        Map<String, Object> props = new HashMap<>();
        props.put("name", name);
        props.put("url", url);

        Context context = new Context();
        context.setVariables(props);
        String html = templateEngine.process("/sendMail/register", context);

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        helper.setTo(email);
        helper.setSubject("Xác thực tài khoản");
        helper.setText(html, true);

        mailSender.send(message);
    }

    @SneakyThrows
    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) {
        Integer executeInternal = (Integer) jobExecutionContext.getMergedJobDataMap().get("executeInternal");
        switch (executeInternal) {
            case 1: {
                mailRegister(jobExecutionContext);
                break;
            }
            case 2: {
                mailCart(jobExecutionContext);
                break;
            }
        }
    }
}
