package com.example.commerce.service;

import com.example.commerce.model.dto.ProductDTO;
import org.springframework.ui.Model;

import java.util.List;

public interface ProductService {
    List<ProductDTO> getAll();

    List<ProductDTO> getByCategory(Long categoryID);

    ProductDTO getById(Long id, Model model);

    String add(ProductDTO productDTO, Model model);

    String update(ProductDTO productDTO, Model model);

    String delete(Long id, Model model);

    void deletes(List<ProductDTO> productDTOS, Model model);

    List<ProductDTO> searchProduct(String name);
}
