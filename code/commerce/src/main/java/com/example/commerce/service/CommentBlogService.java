package com.example.commerce.service;

import com.example.commerce.model.dto.CommentBlogDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface CommentBlogService {
    List<CommentBlogDTO> getComment(Long id);

    void add(CommentBlogDTO commentBlogDTO, Model model);

    List<CommentBlogDTO> getAll();

    void delete(Long id);
}
