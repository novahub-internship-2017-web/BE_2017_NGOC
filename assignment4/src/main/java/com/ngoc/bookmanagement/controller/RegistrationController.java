package com.ngoc.bookmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RegistrationController {

    @GetMapping(value = "/registration")
    public String registrationGet(){
        return "registration";
    }
}
