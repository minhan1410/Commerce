package com.example.commerce.service;

import com.example.commerce.model.dto.CategoriesBlogDTO;

import java.util.List;

public interface CategoryBlogService {
    List<CategoriesBlogDTO> getAll();

    CategoriesBlogDTO getId(Long id);

    CategoriesBlogDTO getByType(String type);
}
