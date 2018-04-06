package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.xml.validation.Validator;

@Controller
public class TestController {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping(value = "/test")
    public String testGet(HttpServletRequest request){
        request.getSession().setAttribute("thu", "abc");
        //System.out.println(bookRepository.getById(1));
        //System.out.println(bookRepository.getAllByEnabled(true));
        //System.out.println(bookRepository.getAllByEnabledAndImage(true, "image"));

        return "test";
    }

}
