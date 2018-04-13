package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.Role;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.RoleRepository;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.validation.GroupUserLogin;
import com.ngoc.bookmanagement.validation.UserValidation;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import javax.validation.groups.Default;

@Service
public class UserServiceImpl implements UserService {

    private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private PasswordEncryption passwordEncryption;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserValidation userValidation;

    @Autowired
    private RoleRepository roleRepository;

    private static void log(javax.servlet.http.HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @Override
    public MessageResponse getUser(String email, String password, HttpServletRequest request) {
        log(request);

        // TODO: refactor code
        MessageResponse messageResponse;
        //Message message;
        messageResponse = userValidation.validateUser(new User(email, password), GroupUserLogin.class);
        if(messageResponse != null)
            return messageResponse;

        String encryptingPassword = passwordEncryption.encryptPassword(password);
        User userLogin = userRepository.findByEmailAndPassword(email, encryptingPassword);

        if (userLogin == null){
            //message = new Message();
            //message.getContent().put("message", "Email is not exist");

            messageResponse = new MessageResponse();
            messageResponse.setCode(MessageResponseConstant.EMAIL_IS_NOT_EXIST);
            //messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        request.getSession().setAttribute("userLogin", userLogin);

        //message = new Message();
        //message.getContent().put("message", "Login successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse getUserById(long userId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        User user = userRepository.findById(userId).get();

        messageResponse = userValidation.checkUserIsExist(userId);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(user);
        return messageResponse;
    }

    @Override
    public MessageResponse createUser(User user, HttpServletRequest request){
        log(request);

        MessageResponse messageResponse;
        //Message message;

        messageResponse = userValidation.validateUser(user, Default.class);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = userValidation.checkEmailIsExist(user);
        if(messageResponse != null)
            return messageResponse;

        Role role = new Role();
        role.setName(RoleConstant.ROLE_USER);
        roleRepository.save(role);

        String encryptingPassword = passwordEncryption.encryptPassword(user.getPassword());
        user.setRoleId(role.getId());
        user.setPassword(encryptingPassword);
        userRepository.save(user);

        //message = new Message();
        //message.getContent().put("message", "Add user successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());

        return messageResponse;
    }

    @Override
    public MessageResponse updateUserById(long userId, User user, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;


        messageResponse = userValidation.checkUserIsExist(userId);
        if(messageResponse != null)
            return messageResponse;

        User oldUser = userRepository.findById(userId).get();
        if(user.getPassword() != null)
            oldUser.setPassword(passwordEncryption.encryptPassword(user.getPassword()));

        oldUser.setFirstName(user.getFirstName());
        oldUser.setLastName(user.getLastName());
        userRepository.save(oldUser);
        request.getSession().setAttribute("userLogin", oldUser);

        //message = new Message();
        //message.getContent().put("message", "Update user successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse updateEnabledById(long userId, boolean enabled, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;

        messageResponse = userValidation.checkUserIsExist(userId);
        if(messageResponse != null)
            return messageResponse;

        User userSelected = userRepository.findById(userId).get();
        userSelected.setEnabled(enabled);
        userRepository.save(userSelected);

        //message = new Message();
        //if(enabled)
        //    message.getContent().put("message", "Unlock user successfully");
        //else
        //    message.getContent().put("message", "Lock user successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());
        return messageResponse;
    }
}
