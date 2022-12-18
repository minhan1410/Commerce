package com.example.commerce.service;

import com.example.commerce.model.dto.ProductDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface ProductService {
    List<ProductDTO> getAll();

    ProductDTO getById(Long id, Model model);

    String add(ProductDTO productDTO, Model model);

    String update(ProductDTO productDTO, Model model);

    String delete(Long id, Model model);
}
