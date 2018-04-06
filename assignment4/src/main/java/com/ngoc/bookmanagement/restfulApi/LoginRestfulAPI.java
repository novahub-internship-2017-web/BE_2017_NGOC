package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
public class LoginRestfulAPI {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncryption passwordEncryption;


    @PostMapping(value = "/api/login", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> loginPost(@RequestBody @Valid User user,
                                       BindingResult bindingResult,
                                       HttpServletRequest request){
        Message message = new Message();

        // TODO : replace this code by validate group
//        if(bindingResult.hasErrors())
//        {
//            message.setMessage(bindingResult.getAllErrors().toString());
//            return new ResponseEntity<Message>(message, HttpStatus.NOT_ACCEPTABLE);
//        }

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());

        if (!userRepository.existsByEmailAndPassword(user.getEmail(), encryptingPassword)){
            message.getContent().put("message", "Email is not exist");
            return new ResponseEntity<Message>(message, HttpStatus.NO_CONTENT);
        }

        request.getSession().setAttribute("userLogin", userRepository.findByEmail(user.getEmail()));
        message.getContent().put("message", "Login successfully");
        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }
}
