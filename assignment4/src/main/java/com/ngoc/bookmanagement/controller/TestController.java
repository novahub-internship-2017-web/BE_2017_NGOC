package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
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
    public ModelAndView testGet(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("test");

        User user = userRepository.findByEmail("admin@gmail.com");
        System.out.println("Role : " + user.getRole());
        System.out.println("Books List : " + user.getBookList());
        return modelAndView;
    }

    @GetMapping(value = "/api/test", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> testGet(){
        Message message = new Message();
        message.getContent().put("message1", "mi ngu qua");
        message.getContent().put("message2", "mi khon hon ai");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

}
