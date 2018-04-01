package com.ngoc.springbootsample.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@PropertySource("classpath:global.properties")
public class HelloController {

    @Autowired
    private MessageSource messageSource;

    @RequestMapping("/index")
    public String index(Model model, HttpServletRequest request) {
        String message = messageSource.getMessage("hello", null, "default message", request.getLocale());
        model.addAttribute("message", message);
        return "index";
    }
}
