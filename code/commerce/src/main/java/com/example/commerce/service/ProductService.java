package com.example.commerce.service;

import com.example.commerce.model.dto.ProductDTO;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ProductService {
    List<ProductDTO> getAll();

    List<ProductDTO> getAllDistinctName(); // get all khong lay cac ten trung nhau

    List<ProductDTO> getRelatedByName(String name);

    List<ProductDTO> getRelatedDistinctNameAndSize(String name);

    List<ProductDTO> getAllDistinctColor(String name, String color);

    List<ProductDTO> getSizesByColor(String name, String color);

    List<ProductDTO> getByCategory(Long categoryID);

    ProductDTO getById(Long id, Model model);

    ProductDTO getByIdAndSize(Long id, String size, Model model);

    String add(ProductDTO productDTO, Model model);

    String duplicate(ProductDTO productDTO, Model model);

    String update(ProductDTO productDTO, Model model);

    String delete(Long id, Model model);

    void deletes(List<ProductDTO> productDTOS, Model model);

    List<ProductDTO> searchProduct(String name);

    String getAllProductForProductPage(Model model, HttpServletRequest request);

    ProductDTO productDetail(Long id, Model model);

    List<ProductDTO> topFeaturedProducts(int top);

}
