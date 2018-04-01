package com.ngoc.springdatajpa.controller;

import com.ngoc.springdatajpa.dao.CustomerRepository;
import com.ngoc.springdatajpa.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    CustomerRepository customerRepository;

    @RequestMapping("/createNewCustomer")
    public String createNewCustomer(){
        Customer customer = new Customer();
        customer.setAddress("dfdsaf");
        customer.setName("ngoc");

        customerRepository.save(customer);
        return "index";
    }

    @RequestMapping("/")
    public String homeGet(){

        System.out.println(customerRepository.findByName("ngoc"));
        return "index";
    }
}
