package com.example.mybatis.controller;

import com.example.mybatis.entity.Customer;
import com.example.mybatis.service.CustomerService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequiredArgsConstructor
public class CustomerController {
    private final CustomerService customerService;

    @PostMapping("/login")
    public String login(Customer customer, HttpSession session){
        Customer cus=customerService.login(customer);
        if(cus!=null){
            session.setAttribute("cus", cus);
        }
        return "redirect:/bookLists";
    }
    @PostMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/bookLists";
    }
}
