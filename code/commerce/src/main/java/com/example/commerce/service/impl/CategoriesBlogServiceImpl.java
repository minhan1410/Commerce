package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import com.example.commerce.model.entity.CategoriesBlog;
import com.example.commerce.repository.CategoriesBlogRepository;
import com.example.commerce.service.CategoriesBlogService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoriesBlogServiceImpl implements CategoriesBlogService {
    private final CategoriesBlogRepository categoriesBlogRepository;
    private final ModelMapper mapper;

    @Override
    public List<CategoriesBlogDTO> getAll() {
        return categoriesBlogRepository.getByDeletedFalse().stream().map(categoriesBlog -> mapper.map(categoriesBlog, CategoriesBlogDTO.class)).toList();
    }

    @Override
    public CategoriesBlogDTO getId(Long id) {
        return mapper.map(categoriesBlogRepository.getByIdAndDeletedFalse(id), CategoriesBlogDTO.class);
    }

    @Override
    public CategoriesBlogDTO getByType(String type) {
        CategoriesBlog getType = categoriesBlogRepository.getByTypeContainsIgnoreCaseAndDeletedFalse(type);
        if (getType == null) {
            return null;
        }
        return mapper.map(getType, CategoriesBlogDTO.class);
    }

    @Override
    @Transactional
    public String add(CategoriesBlogDTO categoriesBlogDTO, Model model) {
        CategoriesBlog getType = categoriesBlogRepository.getByTypeAndDeletedFalse(categoriesBlogDTO.getType());
        if (getType != null) {
            model.addAttribute("err", "da ton tai");
            return "/admin/addCategoriesForBlog";
        }
        categoriesBlogRepository.save(mapper.map(categoriesBlogDTO, CategoriesBlog.class));
        return "redirect:/admin/categories";
    }

    @Override
    public CategoriesBlogDTO getById(Long id, Model model) {
        CategoriesBlog getId = categoriesBlogRepository.getByIdAndDeletedFalse(id);
        if (getId != null) {
            return mapper.map(getId, CategoriesBlogDTO.class);
        }
        model.addAttribute("err", "k da ton tai");
        return null;
    }

    @Override
    @Transactional
    public String update(CategoriesBlogDTO categoriesBlogDTO, Model model) {
        CategoriesBlogDTO getId = getById(categoriesBlogDTO.getId(), model);
        CategoriesBlog getType = categoriesBlogRepository.getByTypeAndDeletedFalse(categoriesBlogDTO.getType());
        if (getId == null || (getType != null && !getType.getId().equals(categoriesBlogDTO.getId()))) {
            model.addAttribute("err", "da ton tai");
            return "/admin/editCategoriesForBlog";
        }
        categoriesBlogRepository.save(categoriesBlogRepository.save(mapper.map(getId, CategoriesBlog.class).update(categoriesBlogDTO)));
        return "redirect:/admin/categories";
    }

    @Override
    @Transactional
    public void delete(Long id, Model model) {
        CategoriesBlogDTO getId = getById(id, model);
        if (getId != null) {
            getId.setDeleted(true);
            categoriesBlogRepository.save(mapper.map(getId, CategoriesBlog.class));

        }
    }
}
