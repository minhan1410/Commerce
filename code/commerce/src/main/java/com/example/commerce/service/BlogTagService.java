package com.example.commerce.service;

import com.example.commerce.model.dto.BlogTagDTO;
import com.example.commerce.model.dto.TagDTO;

import java.util.List;

public interface BlogTagService {
    List<BlogTagDTO> getByBlogId(Long blogId);

    List<BlogTagDTO> getByTagId(Long tagId);

    List<TagDTO> getTag(Long blogId);
}
