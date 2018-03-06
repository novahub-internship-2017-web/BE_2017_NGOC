package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;

@Controller
public class ExceptionController {

    private static final Logger logger = Logger.getLogger(ExceptionHandler.class);

    @GetMapping(value = "/duplicateEmailException")
    public String duplicateEmailExceptionGet(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        redirectAttributes.addFlashAttribute(Constant.errorMessageSession, "Email is exist");

        return "redirect:/registration";
    }

    @GetMapping(value = "/userNullException")
    public String userNullException(HttpServletRequest request, Model model){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        return "error/404";
    }
}
