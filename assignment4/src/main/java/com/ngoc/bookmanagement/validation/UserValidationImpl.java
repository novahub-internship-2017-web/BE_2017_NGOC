package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserValidationImpl implements UserValidation {

    @Autowired
    private UserRepository userRepository;

    @Override
    public MessageResponse checkUserIsExist(long userId) {
        MessageResponse messageResponse = null;
        Message message;

        if(!userRepository.existsById(userId)){
            message = new Message();
            message.getContent().put("message", "User is not exist");

            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }
}
