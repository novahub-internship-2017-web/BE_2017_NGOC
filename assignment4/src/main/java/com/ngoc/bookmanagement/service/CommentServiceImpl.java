package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.*;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.validation.GroupCommentCreate;
import com.ngoc.bookmanagement.validation.GroupCommentUpdate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.validation.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Service
public class CommentServiceImpl implements CommentService {

    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private BookRepository bookRepository;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    @Override
    public MessageResponse getCommentById(long commentId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse = new MessageResponse();

        Comment commentIsSelected = commentRepository.getCommentById(commentId);

        if(commentIsSelected == null){
            Message message = new Message();
            message.getContent().put("message", "Comment isn't exist");

            messageResponse.setCode(MessageResponseConstant.COMMENT_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(commentIsSelected);
        return  messageResponse;
    }

    @Override
    public MessageResponse getAllCommentsByBookId(long bookId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse = new MessageResponse();

        if(!bookRepository.existsById(bookId)){
            Message message = new Message();
            message.getContent().put("message", "Book is not exist");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        List<Comment> commentList = commentRepository.getAllByBookId(bookId);
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(commentList);
        return messageResponse;
    }

    @Override
    public MessageResponse createCommentOfBookByBookId(long bookId, Comment comment, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();

        if(!bookRepository.existsById(bookId)){
            message.getContent().put("message", "Book is not exist");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        Set<ConstraintViolation<Comment>> constraintViolations = validator.validate(comment, GroupCommentCreate.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Comment> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.COMMENT_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        long userId = ((User) request.getSession().getAttribute("userLogin")).getId();

        comment.setCreatedAt(new Date());
        comment.setUpdatedAt(new Date());
        comment.setBookId(bookId);
        comment.setUserId(userId);
        commentRepository.save(comment);

        message.getContent().put("message", "Create new comment successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse updateCommentById(long commentId, Comment comment, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();

        if(!commentRepository.existsById(commentId)){
            message.getContent().put("message", "Comment is not exist");

            messageResponse.setCode(MessageResponseConstant.COMMENT_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        Set<ConstraintViolation<Comment>> constraintViolations = validator.validate(comment, GroupCommentUpdate.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Comment> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.COMMENT_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        Comment commentIsSelected = commentRepository.findById(commentId).get();
        commentIsSelected.setUpdatedAt(new Date());
        commentIsSelected.setMessage(comment.getMessage());
        commentRepository.save(commentIsSelected);

        message.getContent().put("message", "Update comment successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());

        return messageResponse;
    }

    @Override
    public MessageResponse deleteCommentById(long commentId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();

        if(!commentRepository.existsById(commentId)){
            message.getContent().put("message", "Comment is not exist");

            messageResponse.setCode(MessageResponseConstant.COMMENT_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
            return messageResponse;
        }

        commentRepository.deleteById(commentId);

        message.getContent().put("message", "Delete comment successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }
}
