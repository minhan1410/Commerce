package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.entity.Blog;
import com.example.commerce.repository.BlogRepository;
import com.example.commerce.service.BlogService;
import com.example.commerce.service.CloudinaryService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BlogServiceImpl implements BlogService {
    private final BlogRepository blogRepository;
    private final ModelMapper mapper;
    private final CloudinaryService cloudinaryService;

    @Override
    public List<BlogDTO> getAll() {
        return blogRepository.getByDeleted(false).stream().map(blog -> mapper.map(blog, BlogDTO.class)).toList();
    }

    @Override
    public BlogDTO getById(Long id, Model model) {
        Optional<Blog> findBlog = blogRepository.findById(id);
        if (findBlog.isEmpty() || findBlog.get().getDeleted()) {
            model.addAttribute("err", "k ton tai");
            return null;
        }
        return mapper.map(findBlog.get(), BlogDTO.class);
    }

    @Override
    @Transactional
    public String add(BlogDTO dto, Model model) {
        cloudinaryService.uploadImageBlog(dto);
        blogRepository.save(mapper.map(dto, Blog.class));
        return "redirect:/admin/blog";
    }

    @Override
    @Transactional
    public String update(BlogDTO dto, Model model) {
        BlogDTO getById = getById(dto.getId(), model);
        if (Objects.isNull(getById)) {
            return "/admin/editBlog";
        }
        cloudinaryService.deleteImageBlog(dto, getById);
        cloudinaryService.uploadImageBlog(dto);
        blogRepository.save(mapper.map(getById, Blog.class));
        return "redirect:/admin/blog";
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
        BlogDTO getId = getById(id, model);
        if (getId != null) {
            getId.setDeleted(true);
            blogRepository.save(mapper.map(getId, Blog.class));
        }
        return "redirect:/admin/blog";
    }
}
