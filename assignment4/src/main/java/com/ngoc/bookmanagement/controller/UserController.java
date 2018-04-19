package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.UserService;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.awt.print.Pageable;

@RestController
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/user/{id}")
    public String userGet(){
        return "user_profile";
    }

    // API for login
    // API get user (login) with header {email, password}
    @GetMapping(value = "/api/user", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getUser(@RequestHeader("email") String email,
                                     @RequestHeader("password") String password,
                                     HttpServletRequest request){
        MessageResponse messageResponse = userService.getUser(email, password, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API get an User
    @GetMapping(value = "/api/user/{userId}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> getUser(@PathVariable("userId") long userId,
                                     HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = userService.getUserById(userId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API create an User
    @PostMapping(value = "/api/user", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> registrationPost(@RequestBody User user,
                                              HttpServletRequest request) {
        MessageResponse messageResponse = userService.createUser(user, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API update User
    @PutMapping(value = "/api/user/{userId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateUserProfile(@PathVariable("userId") long userId,
                                               @RequestBody User userParam,
                                               HttpServletRequest request,
                                               @SessionAttribute("userLogin") User userLogin){
        MessageResponse messageResponse;

        if(!checkTrueUserOrAdminPermission(userId, userLogin)){
            messageResponse = new MessageResponse();
            messageResponse.setCode(MessageResponseConstant.ACCESS_DENIED);
        }
        else
            messageResponse = userService.updateUserById(userId, userParam, request);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }


    @PutMapping(value = "/api/user/{userId}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockUser(@PathVariable("userId") long userId,
                                      HttpServletRequest request,
                                      @SessionAttribute("userLogin") User userLogin){
        MessageResponse messageResponse;

        if(!checkAdminPermission(userLogin)){
            messageResponse = new MessageResponse();
            messageResponse.setCode(MessageResponseConstant.ACCESS_DENIED);
        }
        else
            messageResponse = userService.updateEnabledById(userId, false, request);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{userId}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockUser(@PathVariable("userId") long userId,
                                        HttpServletRequest request,
                                        @SessionAttribute("userLogin") User userLogin){
        MessageResponse messageResponse;

        if(!checkAdminPermission(userLogin)){
            messageResponse = new MessageResponse();
            messageResponse.setCode(MessageResponseConstant.ACCESS_DENIED);
        }
        else
            messageResponse = userService.updateEnabledById(userId, true, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    private boolean checkAdminPermission(User userLogin){

        return  userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN);
    }

    private boolean checkTrueUserOrAdminPermission(long userId, User userLogin){

        if(userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN))
            return true;

        return userId == userLogin.getId();
    }
}
