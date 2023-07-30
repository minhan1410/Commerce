package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CommentBlogDTO;
import com.example.commerce.model.entity.CommentBlog;
import com.example.commerce.repository.CommentBlogRepository;
import com.example.commerce.service.CommentBlogService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CommentBlogServiceImpl implements CommentBlogService {
    private final CommentBlogRepository commentBlogRepository;
    private final UserService userService;
    private final ModelMapper mapper;

    @Override
    public List<CommentBlogDTO> getComment(Long id) {
        return commentBlogRepository.getByBlogIdAndDeletedFalse(id).stream().map(dto -> mapper.map(dto, CommentBlogDTO.class)).toList();
    }

    @Override
    @Transactional
    public void add(CommentBlogDTO commentBlogDTO, Model model) {
        commentBlogDTO.setReviewerId(userService.getCurrentUser().getId());
        commentBlogRepository.save(mapper.map(commentBlogDTO, CommentBlog.class));
    }

    @Override
    public List<CommentBlogDTO> getAll() {
        return commentBlogRepository.getByDeletedFalse().stream().map(dto -> mapper.map(dto, CommentBlogDTO.class)).toList();
    }

    @Override
    @Transactional
    public void delete(Long id) {
        CommentBlog byId = commentBlogRepository.getById(id);
        byId.setDeleted(true);
        commentBlogRepository.save(byId);
    }

    @Override
    public void deleteByReviewerId(Long reviewerId) {
        List<CommentBlog> getReviewId = commentBlogRepository.getByReviewerIdAndDeletedFalse(reviewerId);
        getReviewId.forEach(commentBlog -> commentBlog.setDeleted(true));
        commentBlogRepository.saveAll(getReviewId);
    }
}
