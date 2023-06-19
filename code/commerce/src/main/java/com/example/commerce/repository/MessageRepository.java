package com.example.commerce.repository;

import com.example.commerce.model.entity.Notification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MessageRepository extends JpaRepository<Notification, Long> {
    List<Notification> getByIsSeenFalseOrderByCreatedAtDesc();

}
