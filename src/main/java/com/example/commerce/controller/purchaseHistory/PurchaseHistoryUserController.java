package com.example.commerce.controller.purchaseHistory;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.service.BillService;
import com.example.commerce.service.CategoriesService;
import com.example.commerce.service.CouponService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Objects;

@Controller
@RequiredArgsConstructor
@RequestMapping("purchase-history")
public class PurchaseHistoryUserController {
    private final UserService userService;
    private final BillService billService;
    private final CouponService couponService;
    private final CategoriesService categoriesService;

    @GetMapping()
    public String purchaseHistory(Model model) {
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("bills", billService.getAllByCurrentUser());
        model.addAttribute("cate", categoriesService.getAll());
        return "purchase-history";
    }

    @GetMapping("/{id}")
    public String billDetail(@PathVariable(name = "id") Long id, Model model) {
        BillDTO billDTO = billService.getById(id);
        if (Objects.isNull(billDTO)) {
            return "error/notFound";
        }
        userService.getCurrentUser(model);
        couponService.getByDiscountMax(model);
        model.addAttribute("bill", billDTO);
        model.addAttribute("cate", categoriesService.getAll());
        return "purchase-history-info";
    }
}
