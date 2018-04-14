package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.*;
import java.util.Set;

@Component
public class UserValidationImpl implements UserValidation {

    @Autowired
    private UserRepository userRepository;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @Override
    public MessageResponse checkUserIsExist(long userId) {
        MessageResponse messageResponse = null;
        //Message message;

        if(!userRepository.existsById(userId)){
            //message = new Message();
            //message.getContent().put("message", "User is not exist");

            messageResponse.setCode(MessageResponseConstant.USER_IS_NOT_EXIST);
            //messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

    @Override
    public MessageResponse validateUser(User user, Class classValidation) {

        MessageResponse messageResponse = null;
        Message message;

        Set<ConstraintViolation<User>> constraintViolations = validator.validate(user, classValidation);

        if(constraintViolations.size() > 0){
            message = new Message();
            for(ConstraintViolation<User> userConstraintViolation : constraintViolations){
                message.getContent().put(userConstraintViolation.getPropertyPath().toString(), userConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.USER_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

    @Override
    public MessageResponse checkEmailIsExist(User user) {
        MessageResponse messageResponse = null;
        //Message message;

        if(userRepository.existsByEmail(user.getEmail())) {
            //message = new Message();
            //message.getContent().put("message", "Email is exist");
            messageResponse = new MessageResponse();
            messageResponse.setCode(MessageResponseConstant.EMAIL_IS_EXIST);
            //messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }
}
