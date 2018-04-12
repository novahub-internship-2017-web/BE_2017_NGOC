package com.ngoc.bookmanagement.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RegistrationController {

    @GetMapping(value = "/registration")
    public String registrationGet(){
        return "registration";
    }

}
