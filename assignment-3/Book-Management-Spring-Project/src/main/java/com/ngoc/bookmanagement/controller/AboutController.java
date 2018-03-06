package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AboutController {

    private static final Logger logger = Logger.getLogger(AboutController.class);

    @GetMapping(value = "/about")
    public String aboutGet(HttpServletRequest request){
        logger.info("/about, method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        return "about";
    }
}
