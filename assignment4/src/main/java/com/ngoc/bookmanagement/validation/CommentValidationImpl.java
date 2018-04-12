package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.*;
import java.util.Set;

@Component
public class CommentValidationImpl implements CommentValidation{

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @Autowired
    private CommentRepository commentRepository;

    public MessageResponse checkCommentIsExist(long commentId){
        MessageResponse messageResponse = null;
        Message message;

        if(!commentRepository.existsById(commentId)){
            message = new Message();
            message.getContent().put("message", "Comment is not exist");

            messageResponse.setCode(MessageResponseConstant.COMMENT_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
        }

        return  messageResponse;
    }

    public MessageResponse validateComment(Comment comment, Class classValidation){
        MessageResponse messageResponse = null;
        Message message = new Message();

        Set<ConstraintViolation<Comment>> constraintViolations = validator.validate(comment, classValidation);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Comment> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.COMMENT_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

}
