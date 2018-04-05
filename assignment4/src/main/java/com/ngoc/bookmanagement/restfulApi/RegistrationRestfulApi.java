package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.*;

import javax.validation.*;
import javax.validation.groups.Default;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

@RestController
public class RegistrationRestfulApi {

    @Autowired
    private RoleRepository roleRepository;

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

    @PostMapping(value = "/api/registration", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> registrationPost(@RequestBody User user) {

        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user, Default.class);
        Message message;

        if(constraintViolations.size() > 0){
            ArrayList<Message> messageArrayList = new ArrayList<>();

            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message = new Message();
                message.setMessage(userConstraintViolation.getPropertyPath() + " : " + userConstraintViolation.getMessage());
                messageArrayList.add(message);
            }

            return new ResponseEntity<List<Message>>( messageArrayList, HttpStatus.NOT_ACCEPTABLE);
        }

        if(userRepository.existsByEmail(user.getEmail())) {
            message = new Message("Email is exist");
            return new ResponseEntity<Message>(message, HttpStatus.CONFLICT);
        }

        Role role = new Role();
        role.setName(RoleConstant.ROLE_USER);
        role = roleRepository.save(role);

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());

        user.setRoleId(role.getId());
        user.setPassword(encryptingPassword);
        user = userRepository.save(user);

        return new ResponseEntity<User>(user, HttpStatus.OK);

    }

    class Message{
        private String message;

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        Message() {
        }

        Message(String message) {
            this.message = message;
        }
    }
}


