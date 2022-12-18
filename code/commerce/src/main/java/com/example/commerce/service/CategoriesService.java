package com.example.commerce.service;

import com.example.commerce.model.dto.CategoriesDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface CategoriesService {
    List<CategoriesDTO> getAll();

    CategoriesDTO getById(Long id, Model model);

    CategoriesDTO getById(Long id);

    CategoriesDTO getByType(String type, Model model);

    String add(CategoriesDTO categoriesDTO, Model model);

    String update(CategoriesDTO categoriesDTO, Model model);

    String delete(Long id, Model model);
}
