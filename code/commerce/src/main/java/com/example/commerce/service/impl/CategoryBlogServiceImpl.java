package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CategoriesBlogDTO;
import com.example.commerce.repository.CategoriesBlogRepository;
import com.example.commerce.service.CategoryBlogService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryBlogServiceImpl implements CategoryBlogService {
    private final CategoriesBlogRepository categoriesBlogRepository;
    private final ModelMapper mapper;

    @Override
    public List<CategoriesBlogDTO> getAll() {
        return categoriesBlogRepository.findAll().stream().map(categoriesBlog -> mapper.map(categoriesBlog, CategoriesBlogDTO.class)).toList();
    }

    @Override
    public CategoriesBlogDTO getId(Long id) {
        return mapper.map(categoriesBlogRepository.getByIdAndDeletedFalse(id), CategoriesBlogDTO.class);
    }

    @Override
    public CategoriesBlogDTO getByType(String type) {
        return mapper.map(categoriesBlogRepository.getByTypeContainsIgnoreCaseAndDeletedFalse(type), CategoriesBlogDTO.class);
    }
}
