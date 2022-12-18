package com.example.commerce.service.impl;

import com.example.commerce.service.MailService;
import lombok.RequiredArgsConstructor;
import org.quartz.*;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.quartz.QuartzJobBean;
import org.springframework.stereotype.Service;
import org.thymeleaf.context.Context;
import org.thymeleaf.spring5.SpringTemplateEngine;

import javax.mail.MessagingException;
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

    public void sendMail(Map<String, Object> props, String email, String template, String subject) throws MessagingException {
        Context context = new Context();
        context.setVariables(props);
        String html = templateEngine.process(template, context);

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");

        helper.setTo(email);
        helper.setSubject(subject);
        helper.setText(html, true);

        mailSender.send(message);
    }

    @Override
    public JobDetail buildJobDetailRegister(String name, String email, String url) {
        JobDataMap jobDataMap = new JobDataMap();

        jobDataMap.put("name", name);
        jobDataMap.put("email", email);
        jobDataMap.put("url", url);

        return JobBuilder.newJob(MailServiceImpl.class)
                .withIdentity(UUID.randomUUID().toString(), "email-jobs")
                .withDescription("Send Email Job")
                .usingJobData(jobDataMap)
                .storeDurably()
                .build();
    }

    @Override
    public Trigger buildJobTriggerRegister(JobDetail jobDetail) {
        return TriggerBuilder.newTrigger()
                .forJob(jobDetail)
                .withIdentity(jobDetail.getKey().getName(), "email-triggers")
                .withDescription("Send Email Trigger")
                .startAt(Date.from(ZonedDateTime.of(LocalDateTime.now(), ZoneId.of("Asia/Saigon")).toInstant()))
                .withSchedule(SimpleScheduleBuilder.simpleSchedule().withMisfireHandlingInstructionFireNow())
                .build();
    }

    @Override
    protected void executeInternal(JobExecutionContext jobExecutionContext) {
        JobDataMap jobDataMap = jobExecutionContext.getMergedJobDataMap();
        String name = jobDataMap.getString("name");
        String email = jobDataMap.getString("email");
        String url = jobDataMap.getString("url");

        sendMailRegister(name, email, url);
    }

    @Override
    public Boolean sendMailRegister(String name, String email, String url) {
        Map<String, Object> props = new HashMap<>();
        props.put("name", name);
        props.put("url", url);
        try {
            sendMail(props, email, "/sendMail/register", "Xác thực tài khoản");
            return true;
        } catch (MessagingException e) {
            return false;
        }
    }
}
