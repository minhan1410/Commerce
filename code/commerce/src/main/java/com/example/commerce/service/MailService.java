package com.example.commerce.service;

import org.quartz.JobDetail;
import org.quartz.Trigger;

import java.time.ZonedDateTime;

public interface MailService {
    Boolean sendMailRegister(String name, String email, String url);

    JobDetail buildJobDetailRegister(String name, String email, String url);

    Trigger buildJobTriggerRegister(JobDetail jobDetail, ZonedDateTime startAt);
}
