package com.example.commerce.service.impl;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartDTO;
import com.example.commerce.model.entity.Bill;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.service.BillService;
import com.example.commerce.service.CartService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {
    private final BillRepository billRepository;
    private final UserService userService;
    private final CartService cartService;
    private final ProductService productService;
    private final ModelMapper mapper;

    @Override
    public List<BillDTO> getAllByUser(Long userId) {
        return billRepository.findByUserIdAndDeletedFalse(userId).stream().map(bill -> {
            CartDTO cartDTO = cartService.getById(bill.getCartId());
            BillDTO billDTO = mapper.map(bill, BillDTO.class);
            billDTO.setCart(cartDTO);
            billDTO.setUser(cartDTO.getUser());
            return billDTO;
        }).toList();
    }

    @Override
    public List<BillDTO> getAllByCurrentUser() {
        return getAllByUser(userService.getCurrentUser().getId());
    }

    @Override
    public BillDTO getById(Long id) {
        Optional<Bill> optional = billRepository.getByIdAndDeletedFalse(id);
        if (optional.isEmpty()) return null;

        BillDTO billDTO = mapper.map(optional.get(), BillDTO.class);
        return billDTO;
    }

    @Override
    public void getBillDetail(Long id, Model model) {
        model.addAttribute("bill", getById(id));
        model.addAttribute("products", productService.getByListId(billRepository.getByProductId(id)));
    }
}
