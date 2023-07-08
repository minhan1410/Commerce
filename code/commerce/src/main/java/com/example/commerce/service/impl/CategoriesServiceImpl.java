package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.model.entity.Categories;
import com.example.commerce.repository.CategoriesRepository;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class CategoriesServiceImpl implements CategoriesService {
    private final CategoriesRepository categoriesRepository;
    private final ModelMapper mapper;
    private final ProductService productService;

    @Override
    public List<CategoriesDTO> getAll() {
        return categoriesRepository.getAllByDeleted(false).stream().map(category -> mapper.map(category, CategoriesDTO.class)).toList();
    }

    @Override
    public CategoriesDTO getById(Long id, RedirectAttributes redirectAttributes) {
        Optional<Categories> findCategory = categoriesRepository.getByIdAndDeletedFalse(id);
        if (findCategory.isEmpty()) {
            redirectAttributes.addFlashAttribute("err", "Quantity not found");
            return null;
        }
        return mapper.map(findCategory.get(), CategoriesDTO.class);
    }

    @Override
    public CategoriesDTO getById(Long id) {
        Optional<Categories> findCategory = categoriesRepository.getByIdAndDeletedFalse(id);
        if (findCategory.isEmpty()) {
            return null;
        }
        return mapper.map(findCategory.get(), CategoriesDTO.class);
    }

    @Override
    public CategoriesDTO getByType(String type, RedirectAttributes redirectAttributes) {
        Optional<Categories> findCategory = categoriesRepository.findByTypeAndDeleted(type, false);
        if (findCategory.isPresent()) {
            redirectAttributes.addFlashAttribute("err", "Category type existed");
            return mapper.map(findCategory.get(), CategoriesDTO.class);
        }
        return null;
    }

    @Override
    @Transactional
    public String add(CategoriesDTO categoriesDTO, RedirectAttributes redirectAttributes) {
        if (getByType(categoriesDTO.getType(), redirectAttributes) != null) return "/admin/category/list-category";
        categoriesRepository.save(mapper.map(categoriesDTO, Categories.class));
        return "redirect:/admin/categories";
    }

    @Override
    @Transactional
    public String update(CategoriesDTO categoriesDTO, RedirectAttributes redirectAttributes) {
        CategoriesDTO getById = getById(categoriesDTO.getId(), redirectAttributes);
        if (getById == null || getByType(categoriesDTO.getType(), redirectAttributes) != null)
            return "/admin/category/list-category";
        categoriesRepository.save(mapper.map(getById, Categories.class).update(categoriesDTO));
        return "redirect:/admin/categories";
    }

    @Override
    @Transactional
    public String delete(Long id, RedirectAttributes redirectAttributes) {
        CategoriesDTO getId = getById(id, redirectAttributes);
        if (getId != null) {
            getId.setDeleted(true);
            categoriesRepository.save(mapper.map(getId, Categories.class).delete());
//            delete all product
            productService.deletes(productService.getByCategory(id), redirectAttributes);
        }
        return "redirect:/admin/categories";
    }

    @Override
    public Long getIdByType(String type) {
        return categoriesRepository.getByTypeIgnoreCaseAndDeletedFalse(type).getId();
    }

}
