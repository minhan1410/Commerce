package com.example.commerce.service.impl;

import com.cloudinary.utils.StringUtils;
import com.example.commerce.constants.BillStatus;
import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartDTO;
import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.CouponDTO;
import com.example.commerce.model.entity.Bill;
import com.example.commerce.model.excel.RenderBill;
import com.example.commerce.repository.BillRepository;
import com.example.commerce.service.*;
import lombok.RequiredArgsConstructor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BillServiceImpl implements BillService {
    private final BillRepository billRepository;
    private final UserService userService;
    private final CartService cartService;
    private final CouponService couponService;
    private final ProductService productService;
    private final ModelMapper mapper;

    @Override
    public List<BillDTO> getAll() {
        return billRepository.getByDeletedFalseOrderByCreateTimeDesc().stream().map(bill -> {
            CartDTO cartDTO = cartService.getById(bill.getCartId());
            BillDTO billDTO = mapper.map(bill, BillDTO.class);

            List<BillStatus> statusList = new ArrayList<>();
            if (billDTO.getStatus().equals(BillStatus.WAIT)) statusList.add(BillStatus.CONFIRM);
            if (billDTO.getStatus().equals(BillStatus.WAIT) || billDTO.getStatus().equals(BillStatus.CONFIRM))
                statusList.add(BillStatus.DELIVERY);
            if (billDTO.getStatus().equals(BillStatus.WAIT) || billDTO.getStatus().equals(BillStatus.CONFIRM) || billDTO.getStatus().equals(BillStatus.DELIVERY))
                statusList.add(BillStatus.RECEIVED);

            billDTO.setUser(userService.getById(billDTO.getUserId()));
            billDTO.setCart(cartDTO);
            billDTO.setCartItem(getCartItemById(billDTO.getId()));
            billDTO.setCoupon(couponService.getById(billDTO.getCouponId()));
            billDTO.setStatusNext(statusList);
            return billDTO;
        }).toList();
    }

    @Override
    public List<BillDTO> getAllByUser(Long userId) {
        return getAll().stream().filter(bill -> bill.getUserId().equals(userId)).toList();
    }

    @Override
    public List<BillDTO> getAllByCurrentUser() {
        return getAllByUser(userService.getCurrentUser().getId());
    }

    @Override
    public BillDTO getById(Long id) {
        return getAll().stream().filter(bill -> bill.getId().equals(id)).findFirst().orElse(null);
    }

    @Override
    public List<CartItemDTO> getCartItemById(Long id) {
        return billRepository.getByCartItemId(id).stream().map(cartItem -> {
            CartItemDTO cartItemDTO = CartItemDTO.builder()
                    .id(cartItem.getId())
                    .cartId(cartItem.getCartId())
                    .quantity(cartItem.getQuantity())
                    .product(productService.getById(cartItem.getProductId()))
                    .previousProductImgMain(cartItem.getPreviousProductImgMain())
                    .previousProductName(cartItem.getPreviousProductName())
                    .previousProductPrice(cartItem.getPreviousProductPrice())
                    .previousProductColor(cartItem.getPreviousProductColor())
                    .previousProductSize(cartItem.getPreviousProductSize())
                    .deleted(cartItem.getDeleted()).build();
            return cartItemDTO;
        }).toList();
    }

    @Override
    @Transactional
    public void setStatus(Long id, BillStatus status) {
        Date date = new Date();
        BillDTO billDTO = getById(id);
        billDTO.setStatus(status);
        switch (status) {
            case CONFIRM -> billDTO.setConfirmTime(date);
            case DELIVERY -> billDTO.setDeliveryTime(date);
            case RECEIVED -> billDTO.setReceivedTime(date);
        }
        billRepository.save(mapper.map(billDTO, Bill.class));
    }

    @Override
    public void export(HttpServletResponse response) throws IOException {
        String fileName = "data.xlsx";
        List<RenderBill> data = mapExcel();

        try (Workbook workbook = new XSSFWorkbook()) {
            Sheet sheet = workbook.createSheet("My Data");
            Class<?> dtoClass = RenderBill.class;
            Field[] fields = dtoClass.getDeclaredFields();

            // Tạo Style cho header
            CellStyle headerStyle = workbook.createCellStyle();
            Font headerFont = workbook.createFont();
            headerFont.setBold(true);
            headerStyle.setFont(headerFont);

            Row headerRow = sheet.createRow(0);
            int columnIndex = 0;
            for (Field field : fields) {
                field.setAccessible(true);
                Cell cell = headerRow.createCell(columnIndex++);
                String fieldName = field.getName();
                cell.setCellValue(fieldName);
                cell.setCellStyle(headerStyle);
            }

            int rowIndex = 1;
            for (RenderBill dto : data) {
                Row row = sheet.createRow(rowIndex++);
                columnIndex = 0;
                for (Field field : fields) {
                    field.setAccessible(true);
                    try {
                        Object value = field.get(dto);
                        row.createCell(columnIndex++).setCellValue(value != null ? value.toString() : "");
                    } catch (IllegalAccessException e) {
                        e.printStackTrace();
                    }
                }
            }

            response.setHeader("Content-Disposition", "attachment; filename=" + fileName);
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");

            try (OutputStream outputStream = response.getOutputStream()) {
                workbook.write(outputStream);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private List<RenderBill> mapExcel() {
        List<RenderBill> renderBills = new ArrayList<>();
        getAll().forEach(billDTO -> {
            CouponDTO coupon = billDTO.getCoupon();
            String cartItem = StringUtils.join(billDTO.getCartItem().stream().map(c -> c.getProduct().getName() + " x " + c.getQuantity()).toList(), "\n");
            RenderBill renderBill = RenderBill.builder()
                    .id(billDTO.getId())
                    .emailUser(billDTO.getUser().getMail())
                    .cartItem(cartItem)
                    .discount(String.format("%d %%", coupon != null ? coupon.getDiscount() : 0))
                    .totalCart(billDTO.getTotalCart())
                    .priceTotal(billDTO.getPriceTotal())
                    .receiverName(billDTO.getReceiverName())
                    .shippingAddress(billDTO.getShippingAddress())
                    .phoneNumber(billDTO.getPhoneNumber())
                    .createTime(billDTO.getCreateTime())
                    .confirmTime(billDTO.getConfirmTime())
                    .deliveryTime(billDTO.getDeliveryTime())
                    .receivedTime(billDTO.getReceivedTime())
                    .status(billDTO.getStatus().name())
                    .build();
            renderBills.add(renderBill);
        });
        return renderBills;
    }
}
