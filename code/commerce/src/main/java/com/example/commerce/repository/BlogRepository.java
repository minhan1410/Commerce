package com.example.commerce.repository;

import com.example.commerce.model.entity.Blog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BlogRepository extends JpaRepository<Blog, Long> {
    List<Blog> getByDeleted(Boolean deleted);

    List<Blog> getByCategoryBlogIdAndDeletedFalse(Long categoryBlogId);

    Blog getByIdAndDeletedFalse(Long id);

}