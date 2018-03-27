package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ErrorController {

    private static final Logger logger = Logger.getLogger(ErrorController.class);

    @GetMapping(value = "/403")
    public String error403(HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        return "error/403";
    }

    @GetMapping(value = "/404")
    public String error404(HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        return "error/404";
    }
}
