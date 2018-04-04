package com.ngoc.bookmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {

    @GetMapping("/user/{id}")
    public String userGet(){
        return "user_profile";
    }
}
