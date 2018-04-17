package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.*;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

@RestController
public class TestController {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserRepository userRepository;

    @RequestMapping("/test")
    public ModelAndView testGet(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("test");
        return modelAndView;
    }

    @Transactional
    @GetMapping(value = "/api/test", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> testGet(HttpServletRequest request){
        User user = userRepository.findByEmail("user@gmail.com");
        System.out.println(user.getRole().getName());

        //User user1 = ((User) request.getSession().getAttribute("userLogin"));
        //System.out.println(userRepository.findById(user1.getId()).get().getRole().getName());

        long id = 1;

        return new ResponseEntity<>(commentRepository.findById(id).get().getUser(), HttpStatus.OK);
    }

}
