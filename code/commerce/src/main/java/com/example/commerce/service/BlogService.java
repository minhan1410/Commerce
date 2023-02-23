package com.example.commerce.service;

import com.example.commerce.model.dto.BlogDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface BlogService {
    List<BlogDTO> getAll();

    BlogDTO getById(Long id, Model model);

    String add(BlogDTO dto, Model model);

    String update(BlogDTO dto, Model model);

    String delete(Long id, Model model);

    void getBlogForBlogPage(Model model, HttpServletRequest request);

    void blogDetail(Long id, Model model, HttpServletRequest request);
}
