package com.example.commerce.repository;

import com.example.commerce.model.entity.CategoriesBlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriesBlogRepository extends JpaRepository<CategoriesBlog, Long> {
    CategoriesBlog getByIdAndDeletedFalse(Long id);

    CategoriesBlog getByTypeContainsIgnoreCaseAndDeletedFalse(String type);

}