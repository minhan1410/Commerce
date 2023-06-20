package com.example.commerce.service;

import org.json.JSONObject;

import java.io.IOException;

public interface AutoChatGPTService {
    static JSONObject createMessage(String role, String content) {
        JSONObject message = new JSONObject();
        message.put("role", role);
        message.put("content", content);
        return message;
    }

    String chat(String message) throws IOException;
}
