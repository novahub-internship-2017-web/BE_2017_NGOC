package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

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

    @GetMapping(value = "/api/test", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> testGet(HttpServletRequest request, Pageable pageable){

        MessageResponse messageResponse = new MessageResponse();
        messageResponse.setCode(200);
        messageResponse.setObject(bookRepository.getAllByEnabled(true, pageable));

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

}
