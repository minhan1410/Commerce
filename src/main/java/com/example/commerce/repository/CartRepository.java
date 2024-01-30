package com.example.commerce.repository;

import com.example.commerce.model.entity.Cart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {
    Optional<Cart> getByIdAndDeletedFalse(Long id);
}
