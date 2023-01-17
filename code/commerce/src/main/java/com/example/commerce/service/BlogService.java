package com.example.commerce.service;

import com.example.commerce.model.dto.BlogDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface BlogService {
    List<BlogDTO> getAll();

    BlogDTO getById(Long id, Model model);

    String add(BlogDTO dto, Model model);

    String update(BlogDTO dto, Model model);

    String delete(Long id, Model model);
}
