package com.example.commerce.service.impl;

import com.example.commerce.constants.BillStatus;
import com.example.commerce.constants.TelegramNotificationType;
import com.example.commerce.model.dto.*;
import com.example.commerce.model.entity.Bill;
import com.example.commerce.model.entity.Cart;
import com.example.commerce.model.entity.CartItem;
import com.example.commerce.model.entity.Notification;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.repository.CartItemRepository;
import com.example.commerce.repository.CartRepository;
import com.example.commerce.repository.MessageRepository;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.apache.logging.log4j.util.Strings;
import org.modelmapper.ModelMapper;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
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
    private final MailService mailService;
    private final SimpMessagingTemplate simpMessagingTemplate;
    private final MessageRepository messageRepository;
    private final TelegramNotificationServiceImpl telegramNotificationService;

    @Override
    @Transactional
    public String addToCart(Long id, String size, int numberProducts, HttpSession session, Model model) {
        ProductDTO byIdAndSize = productService.getByIdAndSize(id, size);
        if (Objects.isNull(byIdAndSize)) {
            return "error/notFound";
        }

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
    public String updateCart(Long id, int quantity, String coupon, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");
        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Double totalPrice = (Double) session.getAttribute("totalPrice");

        if (Strings.isEmpty(coupon)) {
            if (Objects.nonNull(id)) {
                totalOfCart += quantity;
                totalPrice += quantity * map.get(id).getProduct().getPrice();
                CartItemDTO dto = map.get(id);
                dto.setQuantity(dto.getQuantity() + quantity);

                session.setAttribute("cart", map);
                session.setAttribute("totalPriceAfterApplyCoupon", null);
                session.setAttribute("totalPrice", totalPrice);
                session.setAttribute("totalOfCart", totalOfCart);
            }
        } else {
            CouponDTO couponDTO = couponService.findCode(coupon, redirectAttributes);
            if(Objects.isNull(couponDTO)) return "redirect:/cart";

            double totalPriceAfterApplyCoupon = totalPrice - (totalPrice * couponDTO.getDiscount() / 100);
            session.setAttribute("totalPriceAfterApplyCoupon", totalPriceAfterApplyCoupon);
            session.setAttribute("totalPrice", totalPrice);
            session.setAttribute("coupon", couponDTO.getId());
            session.setAttribute("discount", couponDTO.getDiscount());
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
    @Transactional
    public String checkout(String receiverName, String shippingAddress, String phoneNumber, HttpServletRequest request, RedirectAttributes redirectAttributes) {
        HttpSession session = request.getSession();
        Map<Long, CartItemDTO> map = (Map<Long, CartItemDTO>) session.getAttribute("cart");
        Collection<CartItemDTO> cartItemDTOS = map.values();
        List<ProductDTO> productCartItem = productService.getByListId(cartItemDTOS.stream().map(cartItemDTO -> cartItemDTO.getProduct().getId()).toList());

//        Check quantity cartItems
        if (cartItemDTOS.stream()
                .peek(cartItemDTO -> {
                    ProductDTO product = productCartItem.stream().filter(productDTO -> productDTO.getId().equals(cartItemDTO.getProduct().getId())).findFirst().orElseThrow();
                    if (product.getQuantity() - cartItemDTO.getQuantity() < 0) {
                        cartItemDTO.setProduct(product);
                        redirectAttributes.addFlashAttribute("err", String.format("The remaining quantity of product %s is %s", product.getName(), product.getQuantity()));
                    }
                })
                .anyMatch(cartItemDTO -> cartItemDTO.getProduct().getQuantity() - cartItemDTO.getQuantity() < 0)) {
            return "redirect:/cart";
        }


        Integer totalOfCart = (Integer) session.getAttribute("totalOfCart");
        Long coupon = (Long) session.getAttribute("coupon");
        Double totalPrice = (Double) session.getAttribute("totalPrice");
        Double totalPriceAfterApplyCoupon = (Double) session.getAttribute("totalPriceAfterApplyCoupon");
        Double price = coupon == null ? totalPrice : totalPriceAfterApplyCoupon;
        String discount = ((Integer) session.getAttribute("discount")).toString();

        UserDTO currentUser = userService.getCurrentUser();

        Cart cart = cartRepository.save(Cart.builder()
                .userId(currentUser.getId())
                .deleted(false)
                .build());

        cartItemDTOS.forEach(cartItemDTO -> {
            ProductDTO product = productCartItem.stream().filter(productDTO -> productDTO.getId().equals(cartItemDTO.getProduct().getId())).findFirst().orElseThrow();
            product.setQuantity(product.getQuantity() - cartItemDTO.getQuantity());
            cartItemDTO.setProduct(product);
            cartItemDTO.setCartId(cart.getId());
        });
        List<CartItem> cartItems = cartItemDTOS.stream().map(CartItem::mapper).toList();
        cartItemRepository.saveAll(cartItems);
        productService.saveAll(productCartItem);
        billRepository.save(Bill.builder()
                .userId(currentUser.getId())
                .cartId(cart.getId())
                .couponId(coupon)
                .totalCart(totalOfCart)
                .totalPrice(totalPrice)
                .totalPriceAfterApplyCoupon(totalPriceAfterApplyCoupon)
                .priceTotal(price)
                .receiverName(receiverName)
                .shippingAddress(shippingAddress)
                .phoneNumber(phoneNumber)
                .createTime(new Date())
                .status(BillStatus.WAIT)
                .deleted(false)
                .build());

//        Xoa session
        session.invalidate();

//        Gui thong bao den admin
        NotificationDTO notificationDTO = NotificationDTO.builder()
                .fromUser(currentUser.getId())
                .fromUserDTO(currentUser)
                .message(currentUser.getName() + " placed an order")
                .createdAt(LocalDateTime.now())
                .isSeen(false)
                .build();
        Notification notification = messageRepository.save(NotificationDTO.mapperEntity(notificationDTO));
        notificationDTO.setId(notification.getId());
        simpMessagingTemplate.convertAndSend("/notification", notificationDTO);

//        Gui thong tin mua hang thanh cong ve mail
        mailService.sendMailCart(map, totalOfCart, totalPrice, totalPriceAfterApplyCoupon, discount, currentUser);

//        Thong bao mua hang thanh cong telegram
        telegramNotificationService.sendMessage(TelegramNotificationType.ORDER, "New order from " + currentUser.getName() + " with total price: " + price);

//        Chuyen toi trang lich su mua hang
        return "redirect:/purchase-history";
    }

    @Override
    public CartDTO getById(Long id) {
        Optional<Cart> optional = cartRepository.getByIdAndDeletedFalse(id);
        if (optional.isEmpty()) return null;
        Cart cart = optional.get();
        CartDTO dto = mapper.map(cart, CartDTO.class);
        dto.setUser(userService.getById(cart.getUserId()));
        return dto;
    }
}
