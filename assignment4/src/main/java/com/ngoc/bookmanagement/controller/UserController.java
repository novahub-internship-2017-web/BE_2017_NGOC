package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.UserService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Configuration;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @GetMapping("/user/{id}")
    public String userGet(){
        return "user_profile";
    }

    // API get an User
    @GetMapping(value = "/api/user/{userId}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> getUser(@PathVariable("userId") long userId,
                                     HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = userService.getUserById(userId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // 6
    @PutMapping(value = "/api/user/{userId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateUserProfile(@PathVariable("userId") long userId,
                                               @RequestBody User userParam,
                                               HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = userService.updateUserById(userId, userParam, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{userId}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockUser(@PathVariable("userId") long userId,
                                      HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = userService.updateEnabledById(userId, false, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{userId}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockUser(@PathVariable("userId") long userId,
                                        HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = userService.updateEnabledById(userId, true, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }
}
