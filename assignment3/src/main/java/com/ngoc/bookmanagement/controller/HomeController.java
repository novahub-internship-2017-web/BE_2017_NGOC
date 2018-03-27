package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {

    private static final Logger logger = Logger.getLogger(HomeController.class);
    private static boolean isAFirstTime = true;

    @GetMapping(value = "/")
    public String homeGet(HttpServletRequest request) {
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if (isAFirstTime) {
            isAFirstTime = false;
            return "redirect:/createDummyData";
        } else {

            return "home";
        }
    }

    @PostMapping(value = "/")
    public String homePost(@RequestParam("email") String email, HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        return "redirect:/registration?email=" + email;
    }
}
