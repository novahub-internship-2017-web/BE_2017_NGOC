package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private PasswordEncryption passwordEncryption;

    @Autowired
    private UserRepository userRepository;

    @Override
    public MessageResponse getUserById(long userId, HttpServletRequest request) {
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

    @Override
    public MessageResponse updateUserById(long userId, User user, HttpServletRequest request) {
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
