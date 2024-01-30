package com.example.commerce.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.example.commerce.model.dto.BlogDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.CloudinaryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CloudinaryServiceImpl implements CloudinaryService {
    private final Cloudinary cloudinaryConfig;

    public File convertMultiPartToFile(MultipartFile file) throws IOException {
        File convFile = new File(Objects.requireNonNull(file.getOriginalFilename()));
        FileOutputStream fos = new FileOutputStream(convFile);
        fos.write(file.getBytes());
        fos.close();
        return convFile;
    }

    @Override
    public String uploadImage(MultipartFile file) {
        try {
            if (file.isEmpty()) return null;
            File uploadedFile = convertMultiPartToFile(file);
            Map uploadResult = cloudinaryConfig.uploader().upload(uploadedFile, ObjectUtils.emptyMap());
//            System.out.println(uploadedFile.delete() ? "File successfully deleted" : "File doesn't exist");
            return uploadResult.get("url").toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void deleteImage(String url) {
        if (Objects.isNull(url)) return;
        String[] split = url.split("/");
        String[] split1 = split[split.length - 1].split("\\.");
        String publicId = String.join(".", Arrays.copyOf(split1, split1.length - 1));
        try {
            cloudinaryConfig.uploader().destroy(publicId, ObjectUtils.emptyMap());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void uploadImageProduct(ProductDTO dto) {
        String main = uploadImage(dto.getImageMain());
        String hover = uploadImage(dto.getImageHover());
        String sub = uploadImage(dto.getImageSub());
        if (Objects.nonNull(main)) {
            dto.setImgMain(main);
        }
        if (Objects.nonNull(hover)) {
            dto.setImgHover(hover);
        }
        if (Objects.nonNull(sub)) {
            dto.setImgSub(sub);
        }
    }

    @Override
    public void deleteImageProduct(ProductDTO dto, ProductDTO getById) {
        if (!dto.getImageMain().isEmpty()) {
            deleteImage(getById.getImgMain());
        }
        if (!dto.getImageHover().isEmpty()) {
            deleteImage(getById.getImgHover());
        }
        if (!dto.getImageSub().isEmpty()) {
            deleteImage(getById.getImgSub());
        }
    }

    @Override
    public void uploadImageBlog(BlogDTO dto) {
        String img = uploadImage(dto.getImg());
        if (Objects.nonNull(img)) {
            dto.setImage(img);
        }
    }

    @Override
    public void deleteImageBlog(BlogDTO dto, BlogDTO getById) {
        if (!dto.getImg().isEmpty()) {
            deleteImage(getById.getImage());
        }
    }

    @Override
    public void uploadImageMember(UserDTO dto) {
        String img = uploadImage(dto.getImage());
        if (Objects.nonNull(img)) {
            dto.setAvatar(img);
        }
    }

    @Override
    public void deleteImageMember(UserDTO dto, UserDTO getById) {
        if (!dto.getImage().isEmpty()) {
            deleteImage(getById.getAvatar());
        }
    }
}
