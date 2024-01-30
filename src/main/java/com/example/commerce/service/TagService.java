package com.example.commerce.service;

import com.example.commerce.model.dto.TagDTO;

import java.util.List;

public interface TagService {
    List<TagDTO> getAll();

    TagDTO getId(Long id);

    List<TagDTO> getIds(List<Long> ids);
}
