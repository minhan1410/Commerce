package com.example.commerce.service;

import com.example.commerce.model.dto.ProductDTO;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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

    List<ProductDTO> getByListId(List<Long> ids);

    ProductDTO getById(Long id);

    ProductDTO getByIdAndSize(Long id, String size);

    String add(ProductDTO productDTO, RedirectAttributes redirectAttributes);

    String duplicate(ProductDTO productDTO);

    String update(ProductDTO productDTO, RedirectAttributes redirectAttributes);

    String delete(Long id, RedirectAttributes redirectAttributes);

    void deletes(List<ProductDTO> products, RedirectAttributes redirectAttributes);

    List<ProductDTO> searchProduct(String name);

    String getAllProductForProductPage(Model model, HttpServletRequest request);

    ProductDTO productDetail(Long id, Model model);

    List<ProductDTO> topFeaturedProducts(int top);

    void saveAll(List<ProductDTO> productDTOS);

}
