package com.example.commerce.service;

import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.model.entity.Categories;
import org.springframework.ui.Model;

import java.util.List;

public interface CategoriesService {
    List<Categories> getAll();

    CategoriesDTO getById(Long id, Model model);

    CategoriesDTO getByType(String type, Model model);

    String add(CategoriesDTO categoriesDTO, Model model);

    String update(CategoriesDTO categoriesDTO, Model model);

    String delete(Long id, Model model);
}
