package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.UserService;
import com.ngoc.bookmanagement.validation.Validation;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class RegistrationController {

    @Autowired
    private UserService userService;

    @Autowired
    private Validation validation;

    private static final Logger logger = Logger.getLogger(RegistrationController.class);

    @ExceptionHandler(DuplicateEmailException.class)
    public String processDuplicateEmailException(Model model){
        logger.error("Error = Duplicate email exception");

        return "redirect:/duplicateEmailException";
    }


    @GetMapping(value = "/registration")
    public String registrationGet(@RequestParam("email") @Nullable String email,
                                  Model model,
                                  HttpServletRequest request){
        logger.info("/registration, method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, "/registration");

        User user = new User();
        if(email != null)
            user.setEmail(email);
        model.addAttribute("user", user);

        return "registration";
    }


    @PostMapping(value = "/registration")
    public String registrationPost(@ModelAttribute("user") @Valid User user,
                                   BindingResult result,
                                   HttpServletRequest request,
                                   RedirectAttributes redirectAttributes) throws DuplicateEmailException{
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if(!validation.comparePasswordAndMatchingPassword(user.getPassword(), user.getMatchingPassword())){
            result.rejectValue("matchingPassword", "User.matchingPassword", "Two passwords don't equal");
        }

        if(result.hasErrors()){
            logger.info(request.getRequestURI() + ", method = POST, error = Having error about validation");
            logger.info(request.getRequestURI() + ", method = POST, error = " + result.getAllErrors().toString());

            request.setAttribute(Constant.errorMessageSession, "Having error about validation");

            return "registration";
        }
        else {
            user.setRole(Constant.USER_ROLE);
            userService.save(user);

            logger.info(request.getRequestURI() + ", method = POST, message = create new user successfully");
            redirectAttributes.addFlashAttribute(Constant.successMessageSession, "You have registered successfully");

            return "redirect:/login";
        }
    }
}
