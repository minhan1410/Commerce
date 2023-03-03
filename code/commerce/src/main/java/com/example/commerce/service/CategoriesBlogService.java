package com.example.commerce.service;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface CategoriesBlogService {
    List<CategoriesBlogDTO> getAll();

    CategoriesBlogDTO getId(Long id);

    CategoriesBlogDTO getByType(String type);

    String add(CategoriesBlogDTO categoriesBlogDTO, Model model);

    CategoriesBlogDTO getById(Long id, Model model);

    String update(CategoriesBlogDTO categoriesBlogDTO, Model model);

    void delete(Long id, Model model);
}
