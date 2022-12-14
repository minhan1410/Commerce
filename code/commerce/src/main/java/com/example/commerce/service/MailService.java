package com.example.commerce.service;

import org.quartz.JobDetail;
import org.quartz.Trigger;

public interface MailService {
    Boolean sendMailRegister(String name, String email, String url);

    JobDetail buildJobDetailRegister(String name, String email, String url);

    Trigger buildJobTriggerRegister(JobDetail jobDetail);
}
