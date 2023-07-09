package com.example.commerce.service;

import com.example.commerce.model.dto.CategoriesDTO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

public interface CategoriesService {

    List<CategoriesDTO> getAll();

    CategoriesDTO getById(Long id);

    CategoriesDTO getByType(String type, RedirectAttributes redirectAttributes);

    String add(CategoriesDTO categoriesDTO, RedirectAttributes redirectAttributes);

    String update(CategoriesDTO categoriesDTO, RedirectAttributes redirectAttributes);

    String delete(Long id, RedirectAttributes redirectAttributes);

    Long getIdByType(String type);
}
