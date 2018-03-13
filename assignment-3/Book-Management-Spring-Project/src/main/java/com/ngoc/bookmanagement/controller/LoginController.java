package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.PasswordService;
import com.ngoc.bookmanagement.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    @Autowired
    private PasswordService passwordService;

    private static final Logger logger = Logger.getLogger(LoginController.class);

    @GetMapping(value = "/login")
    public String loginGet(Model model,
                           HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        model.addAttribute("user", new User());

        return "login";
    }

    @PostMapping(value = "/login")
    public String loginPost(@ModelAttribute(value = "user") @Valid User user,
                            BindingResult result,
                            HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if (result.hasErrors()) {
            logger.error(request.getRequestURI() + ", method = POST, message = having errors about validation");
            request.setAttribute(Constant.dangerMessageSession, "Having errors about validation");
        } else {
            User userLogin = userService.getUserByEmailAndPassword(user.getEmail(), user.getPassword());

            if(userLogin != null && userLogin.getStatus() == Constant.UNLOCK) {
                logger.info(request.getRequestURI() + ", method = POST, message = successfully");
                userService.writeSession(userLogin, request);

                if(userLogin.getRole() == Constant.ADMIN_ROLE)
                    return "redirect:/admin";
                else
                    return "redirect:/book";
            }
            else{
                if(userLogin == null) {
                    logger.error(request.getRequestURI() + ", method = POST, message = Username or password is incorrect");
                    request.setAttribute(Constant.errorMessageSession, "Username or password is incorrect");
                } else {
                    if (userLogin.getStatus() == Constant.LOCK) {
                        logger.error(request.getRequestURI() + ", method = POST, message = user is blocked");
                        request.setAttribute(Constant.dangerMessageSession, "User is blocked, Please contact administrator to unlock user");
                    }
                }
            }

        }

        return "login";
    }
}


