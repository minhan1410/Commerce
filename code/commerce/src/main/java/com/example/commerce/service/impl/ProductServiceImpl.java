package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.CategoriesDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.entity.Product;
import com.example.commerce.model.entity.Review;
import com.example.commerce.repository.CategoriesRepository;
import com.example.commerce.repository.ProductRepository;
import com.example.commerce.repository.ReviewRepository;
import com.example.commerce.service.CloudinaryService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.function.Function;
import java.util.function.Predicate;

@Service
@RequiredArgsConstructor
@Slf4j
public class ProductServiceImpl implements ProductService {
    private final ProductRepository productRepository;
    private final ModelMapper mapper;
    private final CloudinaryService cloudinaryService;
    private final UserService userService;
    private final CategoriesRepository categoriesRepository;
    private final ReviewRepository reviewRepository;
    private final CacheStore<Long, HttpSession> cartCache;

    public static <T> Predicate<T> distinctByKey(Function<? super T, ?> keyExtractor) {
        Set<Object> seen = ConcurrentHashMap.newKeySet();
        return t -> seen.add(keyExtractor.apply(t));
    }

    @Override
    public List<ProductDTO> getAll() {
        return productRepository.getByDeleted(false).stream().map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getAllDistinctName() {
        return productRepository.getByDeleted(false).stream().filter(product -> product.getQuantity() > 0).filter(distinctByKey(Product::getName))
                .map(product -> mapper.map(product, ProductDTO.class))
                .sorted(Comparator.comparing(ProductDTO::getId))
                .toList();
    }

    @Override
    public List<ProductDTO> getRelatedByName(String name) {
        return productRepository.getByNameAndQuantityGreaterThanAndDeleted(name, 0, false).stream()
                .map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getRelatedDistinctNameAndSize(String name) {
        return getRelatedByName(name).stream().filter(distinctByKey(ProductDTO::getSize)).filter(distinctByKey(ProductDTO::getColor))
                .map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getAllDistinctColor(String name, String color) {
        return getRelatedByName(name).stream().filter(distinctByKey(ProductDTO::getColor)).toList();
    }

    @Override
    public List<ProductDTO> getSizesByColor(String name, String color) {
        return productRepository.getByNameAndColorAndQuantityGreaterThanAndDeleted(name, color, 0, false)
                .stream().map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getByCategory(Long categoryID) {
        return productRepository.getByCategoriesIdAndDeleted(categoryID, false).stream()
                .map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public List<ProductDTO> getByListId(List<Long> ids) {
        return getAll().stream().filter(productDTO -> ids.contains(productDTO.getId())).toList();
    }

    @Override
    public ProductDTO getById(Long id) {
        Product getId = getId(id);
        if (getId == null) {
            return null;
        }
        return mapper.map(getId, ProductDTO.class);
    }

    @Override
    public ProductDTO getByIdAndSize(Long id, String size) {
        ProductDTO getById = getById(id);
        if (getById == null) {
            return null;
        }

        Optional<ProductDTO> optional = getRelatedByName(getById.getName()).stream()
                .filter(p -> p.getColor().equals(getById.getColor()) && p.getSize().equals(size)).findFirst();
        return optional.orElse(null);
    }

    public Product getId(Long id) {
        Optional<Product> findById = productRepository.findByIdAndDeleted(id, false);
        if (findById.isEmpty()) {
            return null;
        }
        return findById.get();
    }

    public ProductDTO getByName(String name) {
        Optional<Product> findByName = productRepository.findByNameAndDeleted(name, false);
        return findByName.map(product -> mapper.map(product, ProductDTO.class)).orElse(null);
    }

    @Override
    @Transactional
    public String add(ProductDTO productDTO, Model model) {
        ProductDTO getByName = getByName(productDTO.getName());
        if (getByName != null) {
            model.addAttribute("err", "The product name already exists");
            return "/admin/product/add-product";
        }
        cloudinaryService.uploadImageProduct(productDTO);
        productRepository.save(mapper.map(productDTO, Product.class));
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public String duplicate(ProductDTO productDTO) {
        if (!productDTO.getImageMain().isEmpty() || !productDTO.getImageSub().isEmpty() || !productDTO.getImageHover().isEmpty()) {
            cloudinaryService.uploadImageProduct(productDTO);
        }
        productRepository.save(new Product().duplicate(getById(productDTO.getId()), productDTO));
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public String update(ProductDTO productDTO, Model model) {
        ProductDTO getById = getById(productDTO.getId());
        if (getById == null) {
            model.addAttribute("err", "Product not found");
            return "/admin/product/edit-product";
        }
        cloudinaryService.deleteImageProduct(productDTO, getById);
        cloudinaryService.uploadImageProduct(productDTO);
        Product save = productRepository.save(mapper.map(getById, Product.class).update(productDTO));

//        Update cart session
        cartCache.getCache().asMap().values().stream().filter(session -> Objects.nonNull(session.getAttribute("cart")))
                .forEach(session -> {
                    Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");

                    Collection<CartItemDTO> cartItemDTOS = map.values();
                    Optional<ProductDTO> optionalProduct = cartItemDTOS.stream().map(CartItemDTO::getProduct).filter(productS -> productS.getId().equals(getById.getId())).findFirst();

                    if (optionalProduct.isPresent()) {
                        ProductDTO productSession = optionalProduct.get().update(save);
                        productSession.setCategories(mapper.map(categoriesRepository.getById(save.getCategoriesId()), CategoriesDTO.class));
                        Double totalPrice = 0d, totalPriceAfterApplyCoupon = 0d;
                        Integer discount = (Integer) session.getAttribute("discount");

                        for (CartItemDTO ci : cartItemDTOS) {
                            totalPrice += ci.getProduct().getPrice() * ci.getQuantity();
                        }

                        if (Objects.nonNull(discount) && discount > 0) {
                            totalPriceAfterApplyCoupon = totalPrice - (totalPrice * discount / 100);
                        }
                        session.setAttribute("totalPrice", totalPrice);
                        session.setAttribute("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
                    }
                });

        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public String delete(Long id, Model model) {
        Product getId = getId(id);
        if (getId != null) {
            productRepository.save(mapper.map(getId, Product.class).delete());
            List<Review> getReviewProduct = reviewRepository.getByProductIdAndDeleted(id, false);
            getReviewProduct.forEach(review -> review.setDeleted(true));
            reviewRepository.saveAll(getReviewProduct);

//            Update cart session
            cartCache.getCache().asMap().values().stream().filter(session -> Objects.nonNull(session.getAttribute("cart")))
                    .forEach(session -> {
                        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");
                        Collection<CartItemDTO> cartItemDTOS = map.values();

                        if (Objects.nonNull(map.remove(id))) {
                            Double totalPrice = 0d, totalPriceAfterApplyCoupon = 0d;
                            Integer discount = (Integer) session.getAttribute("discount"), totalOfCart = 0;

                            for (CartItemDTO ci : cartItemDTOS) {
                                totalOfCart += ci.getQuantity();
                                totalPrice += ci.getProduct().getPrice() * ci.getQuantity();
                            }

                            if (Objects.nonNull(discount) && discount > 0) {
                                totalPriceAfterApplyCoupon = totalPrice - (totalPrice * discount / 100);
                            }
                            session.setAttribute("totalOfCart", totalOfCart);
                            session.setAttribute("totalPrice", totalPrice);
                            session.setAttribute("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
                        }
                    });
        }
        return "redirect:/admin/product";
    }

    @Override
    @Transactional
    public void deletes(List<ProductDTO> productDTOS, Model model) {
        productDTOS.forEach(productDTO -> delete(productDTO.getId(), model));
    }

    @Override
    public List<ProductDTO> searchProduct(String name) {
        return productRepository.findByNameContainingIgnoreCaseAndDeleted(name, false).stream()
                .map(product -> mapper.map(product, ProductDTO.class)).toList();
    }

    @Override
    public String getAllProductForProductPage(Model model, HttpServletRequest request) {
        userService.getCurrentUser(model);

        String getCate = request.getParameter("cateId");
        Long cate = Objects.isNull(getCate) ? -1L : Long.parseLong(getCate);

        String sort = request.getParameter("sort");

        String getKeyword = request.getParameter("keyword");
        String keyword = Objects.isNull(getKeyword) ? "" : getKeyword;

        String getPriceStart = request.getParameter("priceStart");
        long priceStart = (Objects.isNull(getPriceStart) || getPriceStart.isBlank()) ? 0 : Long.parseLong(getPriceStart);

        String getPriceEnd = request.getParameter("priceEnd");
        long priceEnd = (Objects.isNull(getPriceEnd) || getPriceEnd.isBlank()) ? 0 : Long.parseLong(getPriceEnd);

        String getPage = request.getParameter("page");
        int page = Objects.isNull(getPage) ? 20 : Integer.parseInt(getPage);

        List<ProductDTO> listProducts = getAllDistinctName();

        if (Objects.nonNull(sort) && !sort.equals("null")) {
            if (sort.equals("desc")) {
                listProducts = listProducts.stream().sorted(Comparator.comparing(ProductDTO::getPrice).reversed()).toList();
            } else {
                listProducts = listProducts.stream().sorted(Comparator.comparing(ProductDTO::getPrice)).toList();
            }
        }
        if (cate > -1) {
            listProducts = listProducts.stream().filter(dto -> dto.getCategoriesId().equals(cate)).toList();
        }
        if (!keyword.isBlank()) {
            listProducts = listProducts.stream().filter(dto -> dto.getName().toLowerCase().contains(keyword.toLowerCase())).toList();
        }
        if (priceStart > 0) {
            listProducts = listProducts.stream().filter(dto -> dto.getPrice() >= priceStart).toList();
        }
        if (priceEnd > 0) {
            listProducts = listProducts.stream().filter(dto -> dto.getPrice() <= priceEnd).toList();
        }

        model.addAttribute("products", listProducts.stream().limit(page).toList());
        request.setAttribute("sort", sort);
        request.setAttribute("page", page);
        request.setAttribute("priceStart", priceStart);
        request.setAttribute("priceEnd", priceEnd);
        request.setAttribute("keyword", keyword);

        return "product";
    }

    @Override
    public ProductDTO productDetail(Long id, Model model) {
        userService.getCurrentUser(model);
        ProductDTO product = getById(id);
        if (product == null) {
            return null;
        }

        List<ProductDTO> sizes = getSizesByColor(product.getName(), product.getColor());
        List<ProductDTO> colors = getAllDistinctColor(product.getName(), product.getColor());
        model.addAttribute("sizes", sizes);
        model.addAttribute("colors", colors);

        return product;
    }

    @Override
    public List<ProductDTO> topFeaturedProducts(int top) {
        return getAllDistinctName().stream().sorted(Comparator.comparing(ProductDTO::getQuantity).reversed()).limit(top).toList();
    }

    @Override
    @Transactional
    public void saveAll(List<ProductDTO> productDTOS) {
        productRepository.saveAll(productDTOS.stream().map(productDTO -> mapper.map(productDTO, Product.class)).toList());
    }
}
