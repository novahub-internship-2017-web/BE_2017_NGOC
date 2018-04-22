package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

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

//    @Transactional
//    @GetMapping(value = "/api/test", produces = {MediaType.APPLICATION_JSON_VALUE})
//    @JsonIgnoreProperties("pageable")
//    public ResponseEntity<?> testGet(HttpServletRequest request, Pageable pageable){
//
//        MessageResponse messageResponse = new MessageResponse();
//        messageResponse.setCode(200);
//        messageResponse.setObject(userRepository.findAll(pageable));
//
//        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
//    }

}
