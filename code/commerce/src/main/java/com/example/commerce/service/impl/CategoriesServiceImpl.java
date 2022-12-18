package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.model.entity.Categories;
import com.example.commerce.repository.CategoriesRepository;
import com.example.commerce.service.CategoriesService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoriesServiceImpl implements CategoriesService {
    private final CategoriesRepository categoriesRepository;
    private final ModelMapper mapper;

    @Override
    public List<Categories> getAll() {
        return categoriesRepository.getAllByDeleted(false);
    }

    @Override
    public CategoriesDTO getById(Long id, Model model) {
        Optional<Categories> findCategory = categoriesRepository.findById(id);
        if (findCategory.isEmpty()) {
            model.addAttribute("err", "k ton tai");
            return null;
        }
        return mapper.map(findCategory.get(), CategoriesDTO.class);
    }

    @Override
    public CategoriesDTO getByType(String type, Model model) {
        Optional<Categories> findCategory = categoriesRepository.findByTypeAndDeleted(type, false);
        if (findCategory.isPresent()) {
            model.addAttribute("err", "da ton tai");
            return mapper.map(findCategory.get(), CategoriesDTO.class);
        }
        return null;
    }

    @Override
    public String add(CategoriesDTO categoriesDTO, Model model) {
        if (getByType(categoriesDTO.getType(), model) != null) return "/admin/addCategories";
        categoriesDTO.setDeleted(false);
        categoriesRepository.save(mapper.map(categoriesDTO, Categories.class));
        return "redirect:/admin/categories";
    }

    @Override
    public String update(CategoriesDTO categoriesDTO, Model model) {
        CategoriesDTO getById = getById(categoriesDTO.getId(), model);
        if (getById == null) return "/admin/editCategories";
        if (getByType(categoriesDTO.getType(), model) != null) return "/admin/editCategories";
        categoriesRepository.save(mapper.map(getById, Categories.class).update(categoriesDTO));
        return "redirect:/admin/categories";
    }

    @Override
    public String delete(Long id, Model model) {
        categoriesRepository.delete(mapper.map(getById(id, model), Categories.class));
        return "redirect:/admin/categories";
    }

}
