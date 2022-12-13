package com.example.commerce.repository;

import com.example.commerce.model.entity.CommentBlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentBlogRepository extends JpaRepository<CommentBlog, Long> {
}