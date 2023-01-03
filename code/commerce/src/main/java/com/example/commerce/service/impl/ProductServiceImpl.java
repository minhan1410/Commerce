package com.example.commerce.service.impl;

import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.entity.Product;
import com.example.commerce.repository.ProductRepository;
import com.example.commerce.service.CloudinaryService;
import com.example.commerce.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Objects;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final ModelMapper mapper;
    private final CloudinaryService cloudinaryService;

    @Override
    public List<ProductDTO> getAll() {
        return productRepository.getByDeleted(false).stream().map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getByCategory(Long categoryID) {
        return productRepository.getByCategoriesIdAndDeleted(categoryID, false).stream()
                .map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public ProductDTO getById(Long id, Model model) {
        return mapper.map(getId(id, model), ProductDTO.class);
    }

    public Product getId(Long id, Model model) {
        Optional<Product> findById = productRepository.findByIdAndDeleted(id, false);
        if (findById.isEmpty()) {
            model.addAttribute("err", "k ton tai");
            return null;
        }
        return findById.get();
    }

    public ProductDTO getByName(String name, Model model) {
        Optional<Product> findByName = productRepository.findByNameAndDeleted(name, false);
        if (findByName.isPresent()) {
            model.addAttribute("err", "ten da ton tai");
            return mapper.map(findByName.get(), ProductDTO.class);
        }
        return null;
    }

    @Override
    @Transactional
    public String add(ProductDTO productDTO, Model model) {
        ProductDTO getByName = getByName(productDTO.getName(), model);
        if (getByName != null) return "/admin/addProduct";
        cloudinaryService.uploadImageProduct(productDTO);
        productRepository.save(mapper.map(productDTO, Product.class));
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public String update(ProductDTO productDTO, Model model) {
        ProductDTO getById = getById(productDTO.getId(), model);
        if (getById == null || !Objects.equals(getByName(productDTO.getName(), model).getId(), productDTO.getId()))
            return "/admin/editProduct";
        cloudinaryService.deleteImageProduct(productDTO, getById);
        cloudinaryService.uploadImageProduct(productDTO);
        productRepository.save(mapper.map(getById, Product.class).update(productDTO));
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
        Product getId = getId(id, model).delete();
        if (getId != null) {
            productRepository.save(mapper.map(getId, Product.class));
        }
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public void deletes(List<ProductDTO> productDTOS, Model model) {
        productDTOS.forEach(productDTO -> delete(productDTO.getId(), model));
    }
}
