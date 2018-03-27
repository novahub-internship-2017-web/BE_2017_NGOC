package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


@Controller
public class AdminController {

    private static final Logger logger = Logger.getLogger(AdminController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/admin")
    public String adminGet(HttpServletRequest request){
        List<User> userList = userService.listWithUserRole();

        request.setAttribute(Constant.userListAttribute, userList);
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());
        return "admin";
    }

    @GetMapping(value = {"/admin/user/{id}/lock"})
    public String lockUserGet(@PathVariable("id") long id,
                              HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        userService.updateStatus(id, Constant.LOCK);
        logger.info(request.getRequestURI() + ", method = GET, message = lock user " + id);

        return "redirect:/admin";
    }

    @GetMapping(value = {"/admin/user/{id}/unlock"})
    public String unlockUserGet(@PathVariable("id") long id,
                                HttpServletRequest request) {
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        userService.updateStatus(id, Constant.UNLOCK);
        logger.info(request.getRequestURI() + ", method = GET, message = unlock user " + id);

        return "redirect:/admin";
    }

}
