package com.example.commerce.controller.autochat;

import com.example.commerce.service.AutoChatGPTService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;

@RestController
@RequiredArgsConstructor
public class AutoChatGPTController {
    private final AutoChatGPTService autoChatGPTService;

    @PostMapping("/auto-chat")
    public String testTrain(@RequestParam(name = "message") String message) throws IOException {
        return autoChatGPTService.chat(message);
    }
}
