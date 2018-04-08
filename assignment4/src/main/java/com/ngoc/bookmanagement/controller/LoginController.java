package com.ngoc.bookmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

    @GetMapping(value =  "/login")
    public String loginGet(){
        return "login";
    }

    @GetMapping(value = "/admin/home")
    public String adminHome(){
        return "admin_home";
    }

    @GetMapping(value = "/user/home")
    public String userHome(){
        return "user_home";
    }
}
