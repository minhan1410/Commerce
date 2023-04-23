package com.example.commerce.repository;

import com.example.commerce.model.entity.CommentBlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CommentBlogRepository extends JpaRepository<CommentBlog, Long> {
    List<CommentBlog> getByBlogIdAndDeletedFalse(Long blogId);

    List<CommentBlog> getByDeletedFalse();

}