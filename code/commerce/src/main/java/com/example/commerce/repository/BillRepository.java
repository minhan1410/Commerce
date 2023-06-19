package com.example.commerce.repository;

import com.example.commerce.model.entity.Bill;
import com.example.commerce.model.entity.CartItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BillRepository extends JpaRepository<Bill, Long> {
    List<Bill> findByUserIdAndDeletedFalseOrderByCreateTimeDesc(Long userId);

    List<Bill> getByDeletedFalseOrderByCreateTimeDesc();

    Optional<Bill> getByIdAndDeletedFalse(Long id);

    @Query(value = "select ci.productId from Bill b join CartItem ci on b.cartId = ci.cartId where b.id = ?1 and b.deleted = false and ci.deleted = false")
    List<Long> getByProductId(Long billId);

    @Query(value = "select ci from Bill b join CartItem ci on b.cartId = ci.cartId where b.id = ?1 and b.deleted = false and ci.deleted = false")
    List<CartItem> getByCartItemId(Long billId);

    @Query("select count(ci) > 0 from Bill b join CartItem ci on b.cartId = ci.cartId where b.userId = ?1 and ci.productId = ?2 and b.deleted = false and ci.deleted = false")
    Boolean hasCartItems(Long userId, Long productId);
}