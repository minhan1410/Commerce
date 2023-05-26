package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartDTO;
import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {
    private final BillRepository billRepository;
    private final UserService userService;
    private final CartService cartService;
    private final CouponService couponService;
    private final ProductService productService;
    private final ModelMapper mapper;

    @Override
    public List<BillDTO> getAll() {
        return billRepository.getByDeletedFalseOrderByCreateTimeDesc().stream().map(bill -> {
            CartDTO cartDTO = cartService.getById(bill.getCartId());
            BillDTO billDTO = mapper.map(bill, BillDTO.class);
            billDTO.setCart(cartDTO);
            billDTO.setCartItem(getCartItemById(billDTO.getId()));
            billDTO.setCoupon(couponService.getById(billDTO.getCouponId()));
            return billDTO;
        }).toList();
    }

    @Override
    public List<BillDTO> getAllByUser(Long userId) {
        return getAll().stream().filter(bill -> bill.getUserId().equals(userId)).toList();
    }

    @Override
    public List<BillDTO> getAllByCurrentUser() {
        return getAllByUser(userService.getCurrentUser().getId());
    }

    @Override
    public BillDTO getById(Long id) {
        return getAll().stream().filter(bill -> bill.getId().equals(id)).findFirst().orElse(null);
    }

    @Override
    public List<CartItemDTO> getCartItemById(Long id) {
        return billRepository.getByCartItemId(id).stream().map(cartItem -> {
            CartItemDTO cartItemDTO = CartItemDTO.builder()
                    .id(cartItem.getId())
                    .cartId(cartItem.getCartId())
                    .quantity(cartItem.getQuantity())
                    .product(productService.getById(cartItem.getProductId()))
                    .deleted(cartItem.getDeleted())
                    .build();
            return cartItemDTO;
        }).toList();
    }
}
