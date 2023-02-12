package com.example.commerce.service.impl;

import com.example.commerce.model.dto.TagDTO;
import com.example.commerce.repository.TagRepository;
import com.example.commerce.service.TagService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class TagServiceImpl implements TagService {
    private final TagRepository tagRepository;
    private final ModelMapper mapper;

    @Override
    public List<TagDTO> getAll() {
        return tagRepository.findAll().stream().map(tag -> mapper.map(tag, TagDTO.class)).toList();
    }

    @Override
    public TagDTO getId(Long id) {
        return mapper.map(tagRepository.getById(id), TagDTO.class);
    }

    @Override
    public List<TagDTO> getIds(List<Long> ids) {
        return tagRepository.findAllById(ids).stream().map(tag -> mapper.map(tag, TagDTO.class)).toList();
    }
}
