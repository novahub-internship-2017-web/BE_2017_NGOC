package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.Message;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
public class LoginController {

    @GetMapping(value =  "/login")
    public ModelAndView loginGet(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login");
        return modelAndView;
    }

    @GetMapping(value = "/admin/home")
    public ModelAndView adminHome(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("admin_home");
        return modelAndView;
    }

    @GetMapping(value = "/user/home")
    public ModelAndView userHome(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("user_home");
        return modelAndView;
    }

    @GetMapping(value = "/api/logout", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> logoutPost(HttpServletRequest request){
        request.getSession().invalidate();

        Message message = new Message();
        message.getContent().put("message", "Logout successfully");
        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}
