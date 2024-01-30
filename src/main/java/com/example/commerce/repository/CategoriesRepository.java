package com.example.commerce.repository;

import com.example.commerce.model.entity.Categories;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CategoriesRepository extends JpaRepository<Categories, Long> {
    List<Categories> getAllByDeleted(Boolean deleted);

    Optional<Categories> findByTypeAndDeleted(String type, Boolean deleted);

    Categories getByTypeIgnoreCaseAndDeletedFalse(String type);

    Optional<Categories> getByIdAndDeletedFalse(Long id);
}