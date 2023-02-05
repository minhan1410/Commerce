package com.example.commerce.service.impl;

import com.example.commerce.model.dto.CartItemsDTO;
import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.service.CartItemsService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;

@Service
@RequiredArgsConstructor
public class CartItemsServiceImpl implements CartItemsService {
    private final ProductService productService;
    private final CouponService couponService;

    @Override
    @Transactional
    public String addToCart(Long id, String size, int numberProducts, HttpSession session, Model model) {
        ProductDTO byIdAndSize = productService.getByIdAndSize(id, size, model);
        Map<Long, CartItemsDTO> map = (Map<Long, CartItemsDTO>) session.getAttribute("cart"); //lay session neu co , neu chua co tao 1 session moi la cart
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Objects.isNull(map)) {
            map = new HashMap<>();

            map.put(id, CartItemsDTO.builder().product(byIdAndSize).quantity(numberProducts).build());
            session.setAttribute("cart", map);
            totalOfCart = numberProducts;
            totalPrice = Double.valueOf((numberProducts * byIdAndSize.getPrice()));
        } else {
            CartItemsDTO dto = map.get(id);
            if (Objects.isNull(dto)) { // chua co sp
                dto = CartItemsDTO.builder().product(byIdAndSize).quantity(numberProducts).build();
                map.put(id, dto);
            } else {
                dto.setQuantity(dto.getQuantity() + numberProducts);
            }
            totalOfCart += numberProducts;
            totalPrice += byIdAndSize.getPrice() * numberProducts;
        }
        session.setAttribute("totalPriceAfterApplyCoupon", totalPrice);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("totalOfCart", totalOfCart);
        return "redirect:/product-detail?id=" + id;
    }

    @Override
    @Transactional
    public String updateCart(Long id, int quantity, String coupon, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<Long, CartItemsDTO> map = (Map<Long, CartItemsDTO>) session.getAttribute("cart");
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Objects.isNull(coupon)) {
            totalOfCart += quantity;
            totalPrice += quantity * map.get(id).getProduct().getPrice();
            CartItemsDTO dto = map.get(id);
            dto.setQuantity(dto.getQuantity() + quantity);

            session.setAttribute("cart", map);
            session.setAttribute("totalPriceAfterApplyCoupon", totalPrice);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("totalOfCart", totalOfCart);
        } else {
            CouponDTO code = couponService.findCode(coupon, model);
            session.setAttribute("totalPriceAfterApplyCoupon", totalPrice - (totalPrice * code.getDiscount() / 100));
        }
        return "redirect:/cart";
    }

    @Override
    @Transactional
    public String deleteToCart(Long id, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Map<Long, CartItemsDTO> map = (Map<Long, CartItemsDTO>) session.getAttribute("cart");
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Objects.nonNull(map)) {
            CartItemsDTO dto = map.get(id);
            map.remove(id);
            totalOfCart -= dto.getQuantity();
            totalPrice -= dto.getQuantity() * dto.getProduct().getPrice();

            session.setAttribute("cart", map);
            session.setAttribute("totalPriceAfterApplyCoupon", totalPrice);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("totalOfCart", totalOfCart);
        }
        return "redirect:/cart";
    }
}
