package com.example.commerce.repository;

import com.example.commerce.model.entity.Message;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> getByIsSeenFalseOrderByCreatedAtDesc();

}
