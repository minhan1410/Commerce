package com.example.commerce.service.impl;

import com.example.commerce.constants.BillStatus;
import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.entity.Bill;
import com.example.commerce.model.entity.Cart;
import com.example.commerce.model.entity.CartItem;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.repository.CartItemRepository;
import com.example.commerce.repository.CartRepository;
import com.example.commerce.service.CartService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.ProductService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.*;

@Service
@RequiredArgsConstructor
public class CartServiceImpl implements CartService {
    private final ModelMapper mapper;
    private final CartRepository cartRepository;
    private final CartItemRepository cartItemRepository;
    private final ProductService productService;
    private final CouponService couponService;
    private final UserService userService;
    private final BillRepository billRepository;

    @Override
    @Transactional
    public String addToCart(Long id, String size, int numberProducts, HttpSession session, Model model) {
        ProductDTO byIdAndSize = productService.getByIdAndSize(id, size, model);
        Long currentProductId = byIdAndSize.getId();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart"); //lay session neu co , neu chua co tao 1 session moi la cart
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        CartItemDTO cartItemDTO = CartItemDTO.builder()
                .product(byIdAndSize)
                .quantity(numberProducts)
                .deleted(false)
                .build();

        if (Objects.isNull(map)) {
            map = new HashMap<>();
            map.put(currentProductId, cartItemDTO);
            session.setAttribute("cart", map);
            totalOfCart = numberProducts;
            totalPrice = Double.valueOf((numberProducts * byIdAndSize.getPrice()));
        } else {
            CartItemDTO dto = map.get(currentProductId);
            if (Objects.isNull(dto)) { // chua co sp
                dto = cartItemDTO;
                map.put(currentProductId, dto);
            } else {
                dto.setQuantity(dto.getQuantity() + numberProducts);
            }
            totalOfCart += numberProducts;
            totalPrice += byIdAndSize.getPrice() * numberProducts;
        }
        session.setAttribute("totalPriceAfterApplyCoupon", null);
        session.setAttribute("totalPrice", totalPrice);
        session.setAttribute("totalOfCart", totalOfCart);
        return "redirect:/product-detail?id=" + id;
    }

    @Override
    @Transactional
    public String updateCart(Long id, int quantity, String coupon, HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Objects.isNull(coupon)) {
            totalOfCart += quantity;
            totalPrice += quantity * map.get(id).getProduct().getPrice();
            CartItemDTO dto = map.get(id);
            dto.setQuantity(dto.getQuantity() + quantity);

            session.setAttribute("cart", map);
            session.setAttribute("totalPriceAfterApplyCoupon", null);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("totalOfCart", totalOfCart);
        } else {
            CouponDTO couponDTO = couponService.findCode(coupon, model);
            double totalPriceAfterApplyCoupon = totalPrice - (totalPrice * couponDTO.getDiscount() / 100);
            session.setAttribute("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("coupon", couponDTO.getId());
        }
        return "redirect:/cart";
    }

    @Override
    @Transactional
    public String deleteToCart(Long id, HttpServletRequest req) {
        HttpSession session = req.getSession();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Objects.nonNull(map)) {
            CartItemDTO dto = map.get(id);
            map.remove(id);
            totalOfCart -= dto.getQuantity();
            totalPrice -= dto.getQuantity() * dto.getProduct().getPrice();

            session.setAttribute("cart", map);
            session.setAttribute("totalPriceAfterApplyCoupon", null);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("totalOfCart", totalOfCart);
        }
        return "redirect:/cart";
    }

    @Override
    public String checkout(String receiverName, String shippingAddress, String phoneNumber, HttpServletRequest request) {
        HttpSession session = request.getSession();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");

        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Long coupon = (Long) session.getAttribute("coupon");
        Double totalPrice = (Double) session.getAttribute("totalPrice");
        Double totalPriceAfterApplyCoupon = (Double) session.getAttribute("totalPriceAfterApplyCoupon");
        Double price = coupon == null ? totalPrice : totalPriceAfterApplyCoupon;

        Cart cart = cartRepository.save(Cart.builder()
                .userId(userService.getCurrentUser().getId())
                .deleted(false)
                .build());

        map.values().forEach(cartItemDTO -> cartItemDTO.setCartId(cart.getId()));
        List<CartItem> cartItems = map.values().stream().map(CartItem::mapper).toList();
        cartItemRepository.saveAll(cartItems);

        billRepository.save(Bill.builder()
                .userId(userService.getCurrentUser().getId())
                .cartId(cart.getId())
                .couponId(coupon)
                .totalCart(totalOfCart)
                .priceTotal(price)
                .receiverName(receiverName)
                .shippingAddress(shippingAddress)
                .phoneNumber(phoneNumber)
                .createTime(new Date())
                .status(BillStatus.WAIT)
                .deleted(false)
                .build());

//        Gui thong tin mua hang thanh cong ve mail
//        Chuyen toi trang lich su mua hang
        return "redirect:/cart";
    }
}
