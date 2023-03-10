package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BlogTagDTO;
import com.example.commerce.model.dto.TagDTO;
import com.example.commerce.model.entity.BlogTag;
import com.example.commerce.repository.BlogTagRepository;
import com.example.commerce.service.BlogTagService;
import com.example.commerce.service.TagService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BlogTagServiceImpl implements BlogTagService {
    private final BlogTagRepository blogTagRepository;
    private final TagService tagService;
    private final ModelMapper mapper;

    @Override
    public List<BlogTagDTO> getByBlogId(Long blogId) {
        return blogTagRepository.getByBlogIdAndDeletedFalse(blogId).stream().map(blogTag -> mapper.map(blogTag, BlogTagDTO.class)).toList();
    }

    @Override
    public List<BlogTagDTO> getByTagId(Long tagId) {
        return blogTagRepository.getByTagIdAndDeletedFalse(tagId).stream().map(blogTag -> mapper.map(blogTag, BlogTagDTO.class)).toList();
    }

    @Override
    public List<TagDTO> getTag(Long blogId) {
        List<Long> tagIds = blogTagRepository.getByBlogIdAndDeletedFalse(blogId).stream().map(BlogTag::getTagId).toList();
        return tagService.getIds(tagIds);
    }

    @Override
    public void add(BlogTagDTO dto) {
        blogTagRepository.save(mapper.map(dto, BlogTag.class));
    }

    @Override
    public void delete(Long blogId, Long tagId) {
        BlogTag get = blogTagRepository.getByBlogIdAndTagIdAndDeletedFalse(blogId, tagId);
        get.setDeleted(true);
        blogTagRepository.save(get);
    }

}
