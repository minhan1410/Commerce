package com.example.commerce.repository;

import com.example.commerce.model.entity.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findByIdAndDeleted(Long id, Boolean deleted);

    List<Product> getByDeleted(Boolean deleted);

    List<Product> getByQuantityGreaterThanAndDeleted(Integer quantity, Boolean deleted);

    List<Product> getByNameAndDeleted(String name, Boolean deleted);

    List<Product> getByNameAndQuantityGreaterThanAndDeleted(String name, Integer quantity, Boolean deleted);

    List<Product> getByNameAndColorNotLikeAndDeleted(String name, String color, Boolean deleted);

    List<Product> getByNameAndColorAndDeleted(String name, String color, Boolean deleted);

    List<Product> getByNameAndColorAndQuantityGreaterThanAndDeleted(String name, String color, Integer quantity, Boolean deleted);

    Optional<Product> findByNameAndDeleted(String name, Boolean deleted);

    List<Product> getByCategoriesIdAndDeleted(Long categoriesId, Boolean deleted);

    List<Product> findByNameContainingIgnoreCaseAndDeleted(String name, Boolean deleted);

}