package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.*;
import javax.validation.groups.Default;
import java.util.Set;

@RestController
public class RegistrationRestfulAPI {

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
        Message message = new Message();

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message.getContent().put(userConstraintViolation.getPropertyPath().toString(), userConstraintViolation.getMessage());
            }

            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_ACCEPTABLE);
        }

        if(userRepository.existsByEmail(user.getEmail())) {
            message.getContent().put("message", "Email is exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.CONFLICT);
        }

        Role role = new Role();
        role.setName(RoleConstant.ROLE_USER);
        role = roleRepository.save(role);

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());

        user.setRoleId(role.getId());
        user.setPassword(encryptingPassword);
        user = userRepository.save(user);

        return new ResponseEntity<>(user, HttpStatus.OK);
    }
}


