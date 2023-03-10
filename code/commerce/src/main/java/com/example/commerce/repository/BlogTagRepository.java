package com.example.commerce.repository;

import com.example.commerce.model.entity.BlogTag;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BlogTagRepository extends JpaRepository<BlogTag, Long> {
    List<BlogTag> getByBlogIdAndDeletedFalse(Long blogId);

    List<BlogTag> getByTagIdAndDeletedFalse(Long tagId);

    BlogTag getByBlogIdAndTagIdAndDeletedFalse(Long blogId, Long tagId);
}