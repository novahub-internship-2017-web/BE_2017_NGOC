package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import javax.validation.*;
import javax.validation.groups.Default;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    private static final Validator validator;

    @Autowired
    private PasswordEncryption passwordEncryption;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    private static void log(javax.servlet.http.HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @Override
    public MessageResponse getUserById(long userId, HttpServletRequest request) {
        log(request);
        MessageResponse messageResponse = new MessageResponse();

        User user = userRepository.findById(userId).get();

        if(user == null){
            Message message = new Message();
            message.getContent().put("message", "User is not exist");

            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(user);
        return messageResponse;
    }

    // TODO: add into user controller
    @Override
    public MessageResponse createUser(User user, HttpServletRequest request){
        log(request);
        MessageResponse messageResponse = new MessageResponse();
        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user, Default.class);
        Message message = new Message();

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message.getContent().put(userConstraintViolation.getPropertyPath().toString(), userConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.USER_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        if(userRepository.existsByEmail(user.getEmail())) {
            message.getContent().put("message", "Email is exist");
            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        Role role = new Role();
        role.setName(RoleConstant.ROLE_USER);
        role = roleRepository.save(role);

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());
        // TODO: try add role into user and use only save user (exclude save role)
        user.setRoleId(role.getId());
        user.setPassword(encryptingPassword);
        user = userRepository.save(user);

        message.getContent().put("message", "Add user successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse updateUserById(long userId, User user, HttpServletRequest request) {
        log(request);
        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();
        User oldUser = userRepository.findById(userId).get();

        if(oldUser == null){
            message.getContent().put("message", "User is not exist");

            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());

        if(user.getPassword() != null)
            oldUser.setPassword(passwordEncryption.encryptPassword(user.getPassword()));

        userRepository.save(oldUser);
        request.getSession().setAttribute("userLogin", oldUser);

        message.getContent().put("message", "Update user successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse updateEnabledById(long userId, boolean enabled, HttpServletRequest request) {
        log(request);
        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();
        User userSelected = userRepository.findById(userId).get();

        if(userSelected == null){
            message.getContent().put("message", "User is not exist");

            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        userSelected.setEnabled(enabled);
        userRepository.save(userSelected);

        if(enabled)
            message.getContent().put("message", "Unlock user successfully");
        else
            message.getContent().put("message", "Lock user successfully");

        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }
}
