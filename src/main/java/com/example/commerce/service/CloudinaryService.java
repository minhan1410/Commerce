package com.example.commerce.service;

import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.UserDTO;
import org.springframework.web.multipart.MultipartFile;

public interface CloudinaryService {
    String uploadImage(MultipartFile file);

    void deleteImage(String url);

    void uploadImageProduct(ProductDTO dto);

    void deleteImageProduct(ProductDTO dto, ProductDTO getById);

    void uploadImageBlog(BlogDTO dto);

    void deleteImageBlog(BlogDTO dto, BlogDTO getById);

    void uploadImageMember(UserDTO dto);

    void deleteImageMember(UserDTO dto, UserDTO getById);
}
