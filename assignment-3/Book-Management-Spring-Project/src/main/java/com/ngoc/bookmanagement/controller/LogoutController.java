package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class LogoutController {

    private static final Logger logger = Logger.getLogger(LoginController.class);

    @GetMapping(value = "/logout")
    public String logoutGet(HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = Get");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        request.getSession().invalidate();

        return "redirect:/";
    }
}
