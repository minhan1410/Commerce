package com.example.commerce.service;

import com.example.commerce.model.dto.ProductDTO;
import org.springframework.web.multipart.MultipartFile;

public interface CloudinaryService {
    String uploadImage(MultipartFile file);

    void deleteImage(String url);

    void uploadImageProduct(ProductDTO dto);

    void deleteImageProduct(ProductDTO dto, ProductDTO getById);
}
