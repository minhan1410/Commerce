package com.example.commerce.repository;

import com.example.commerce.constants.Role;
import com.example.commerce.model.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByMail(String mail);

    Optional<User> findByVerificationCode(String verificationCode);

    List<User> getByRoleAndDeletedFalse(Role role);

}