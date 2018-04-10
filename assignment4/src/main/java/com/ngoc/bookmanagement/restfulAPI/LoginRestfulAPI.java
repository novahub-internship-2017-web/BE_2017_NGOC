package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import com.ngoc.bookmanagement.validation.GroupUserLogin;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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

    @Autowired
    private RoleRepository roleRepository;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    private static final Logger logger = LoggerFactory.getLogger(BookRestfulAPI.class);

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @PostMapping(value = "/api/login", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> loginPost(@RequestBody User user,
                                       HttpServletRequest request){
        log(request);
        logger.info("User : " + user.toString());

        Message message = new Message();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user, GroupUserLogin.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message.getContent().put(userConstraintViolation.getPropertyPath().toString(), userConstraintViolation.getMessage());
            }

            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_ACCEPTABLE);
        }

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());

        User userLogin = userRepository.findByEmailAndPassword(user.getEmail(), encryptingPassword);

        if (userLogin == null){
            message.getContent().put("message", "Email is not exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }
        Role role = roleRepository.findById(userLogin.getRoleId()).get();
        request.getSession().setAttribute("userLogin", userLogin);

        return new ResponseEntity<>(role, HttpStatus.OK);
    }

    @GetMapping(value = "/api/logout", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> logoutPost(HttpServletRequest request){
        request.getSession().invalidate();

        Message message = new Message();
        message.getContent().put("message", "Logout successfully");
        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}
