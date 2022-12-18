package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.model.entity.Categories;
import com.example.commerce.repository.CategoriesRepository;
import com.example.commerce.service.CategoriesService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoriesServiceImpl implements CategoriesService {
    private final CategoriesRepository categoriesRepository;
    private final ModelMapper mapper;

    @Override
    public List<CategoriesDTO> getAll() {
        return categoriesRepository.getAllByDeleted(false).stream().map(category -> mapper.map(category, CategoriesDTO.class)).toList();
    }

    @Override
    public CategoriesDTO getById(Long id, Model model) {
        Optional<Categories> findCategory = categoriesRepository.findById(id);
        if (findCategory.isEmpty() || findCategory.get().getDeleted()) {
            model.addAttribute("err", "k ton tai");
            return null;
        }
        return mapper.map(findCategory.get(), CategoriesDTO.class);
    }

    @Override
    public CategoriesDTO getById(Long id) {
        Optional<Categories> findCategory = categoriesRepository.findById(id);
        if (findCategory.isEmpty() || findCategory.get().getDeleted()) {
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
    @Transactional
    public String add(CategoriesDTO categoriesDTO, Model model) {
        if (getByType(categoriesDTO.getType(), model) != null) return "/admin/addCategories";
        categoriesRepository.save(mapper.map(categoriesDTO, Categories.class));
        return "redirect:/admin/categories";
    }

    @Override
    @Transactional
    public String update(CategoriesDTO categoriesDTO, Model model) {
        CategoriesDTO getById = getById(categoriesDTO.getId(), model);
        if (getById == null || getByType(categoriesDTO.getType(), model) != null) return "/admin/editCategories";
        categoriesRepository.save(mapper.map(getById, Categories.class).update(categoriesDTO));
        return "redirect:/admin/categories";
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
        CategoriesDTO getId = getById(id, model);
        if (getId != null) {
            getId.setDeleted(true);
            categoriesRepository.save(mapper.map(getId, Categories.class));
        }
//        delete product
        return "redirect:/admin/categories";
    }

}