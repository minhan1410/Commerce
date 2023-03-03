package com.example.commerce.repository;

import com.example.commerce.model.entity.CategoriesBlog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoriesBlogRepository extends JpaRepository<CategoriesBlog, Long> {
    List<CategoriesBlog> getByDeletedFalse();

    CategoriesBlog getByIdAndDeletedFalse(Long id);

    CategoriesBlog getByTypeContainsIgnoreCaseAndDeletedFalse(String type);

    CategoriesBlog getByTypeAndDeletedFalse(String type);


}