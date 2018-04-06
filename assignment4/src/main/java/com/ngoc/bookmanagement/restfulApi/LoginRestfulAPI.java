package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import com.ngoc.bookmanagement.validation.GroupUserLogin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.*;
import java.util.Set;

@RestController
public class LoginRestfulAPI {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncryption passwordEncryption;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @PostMapping(value = "/api/login", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> loginPost(@RequestBody User user,
                                       HttpServletRequest request){
        Message message = new Message();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user, GroupUserLogin.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message.getContent().put(userConstraintViolation.getPropertyPath().toString(), userConstraintViolation.getMessage());
            }

            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_ACCEPTABLE);
        }

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
