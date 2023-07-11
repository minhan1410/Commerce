package com.example.commerce.controller.home;

import com.example.commerce.model.dto.BillDTO;
import com.example.commerce.model.dto.CartItemDTO;
import com.example.commerce.model.dto.ProductDTO;
import com.example.commerce.model.dto.UserDTO;
import com.example.commerce.service.BillService;
import com.example.commerce.service.NotificationService;
import com.example.commerce.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

import static com.example.commerce.constants.BillStatus.WAIT;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class HomeAdminController {
    private final UserService userService;
    private final NotificationService notificationService;
    private final BillService billService;

    @GetMapping()
    public String home(Model model) {
        List<BillDTO> bills = billService.getAll();
        Calendar calendar = Calendar.getInstance();
        int currentMonth = calendar.get(Calendar.MONTH) + 1;
        String[] monthNames = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
        int[] revenue = new int[currentMonth]; // Khởi tạo mảng lưu trữ doanh thu theo từng tháng
        int[] order = new int[currentMonth];
        bills.stream()
                .filter(bill -> {
                    calendar.setTime(bill.getCreateTime());
                    return calendar.get(Calendar.MONTH) >= 0 && calendar.get(Calendar.MONTH) <= 11; // Đảm bảo chỉ xét các tháng từ 0 đến 11 (tháng 1 đến tháng 12)
                })
                .forEach(bill -> {
                    int month = calendar.get(Calendar.MONTH);
                    revenue[month] += bill.getPriceTotal();
                    order[month] += 1;
                });

        List<Map.Entry<ProductDTO, Integer>> topBestSeller = bills.stream().map(BillDTO::getCartItem).flatMap(List::stream)
                .collect(Collectors.groupingBy(cartItemDTO -> cartItemDTO.getProduct(), Collectors.summingInt(CartItemDTO::getQuantity)))
                .entrySet().stream().sorted(Map.Entry.comparingByValue(Comparator.reverseOrder())).limit(10).toList();

        List<Map.Entry<UserDTO, Double>> topPotentialCustomer = bills.stream().collect(Collectors.groupingBy(billDTO -> billDTO.getUser(), Collectors.summingDouble(BillDTO::getPriceTotal)))
                .entrySet().stream().sorted(Map.Entry.comparingByValue(Comparator.reverseOrder())).limit(10).toList();

        userService.getCurrentUser(model);
        model.addAttribute("noti", notificationService.getAllMessageIsSeenFalse());
        model.addAttribute("countUnconfirmedBills", bills.stream().filter(billDTO -> billDTO.getStatus().equals(WAIT)).count());
        model.addAttribute("sumTotalCart", bills.stream().mapToLong(BillDTO::getTotalCart).sum());
        model.addAttribute("sumPrice", bills.stream().mapToDouble(BillDTO::getPriceTotal).sum());
        model.addAttribute("revenueChart", revenue);
        model.addAttribute("orderChart", order);
        model.addAttribute("monthNames", Arrays.copyOfRange(monthNames, 0, currentMonth));
        model.addAttribute("topBestSeller", topBestSeller);
        model.addAttribute("topPotentialCustomer", topPotentialCustomer);
        return "admin/index";
    }

    @GetMapping("/view-noti/{id}")
    public String viewNoti(@PathVariable Long id, HttpServletRequest request) {
        notificationService.viewMessage(id);
        return "redirect:" + request.getHeader("referer").replace(request.getContextPath(), "");
    }

    @GetMapping("/view-all")
    public String viewAll(HttpServletRequest request) {
        notificationService.viewAll();
        return "redirect:" + request.getHeader("referer").replace(request.getContextPath(), "");
    }
}
