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

    Optional<Product> findByNameAndDeleted(String name, Boolean deleted);

}