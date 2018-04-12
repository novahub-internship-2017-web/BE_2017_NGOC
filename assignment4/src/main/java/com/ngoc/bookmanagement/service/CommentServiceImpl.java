package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.*;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.validation.BookValidation;
import com.ngoc.bookmanagement.validation.CommentValidation;
import com.ngoc.bookmanagement.validation.GroupCommentCreate;
import com.ngoc.bookmanagement.validation.GroupCommentUpdate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private BookValidation bookValidation;

    @Autowired
    private CommentValidation commentValidation;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @Override
    public MessageResponse getCommentById(long commentId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;

        messageResponse = commentValidation.checkCommentIsExist(commentId);
        if(messageResponse != null)
            return messageResponse;

        Comment commentIsSelected = commentRepository.getCommentById(commentId);
        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(commentIsSelected);
        return  messageResponse;
    }

    @Override
    public MessageResponse getAllCommentsByBookId(long bookId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = new MessageResponse();
        List<Comment> commentList = commentRepository.getAllByBookId(bookId);
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(commentList);
        return messageResponse;
    }

    @Override
    public MessageResponse createCommentOfBookByBookId(long bookId, Comment comment, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        Message message;

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = commentValidation.validateComment(comment, GroupCommentCreate.class);
        if(messageResponse != null)
            return messageResponse;

        long userId = ((User) request.getSession().getAttribute("userLogin")).getId();

        comment.setCreatedAt(new Date());
        comment.setUpdatedAt(new Date());
        comment.setBookId(bookId);
        comment.setUserId(userId);
        commentRepository.save(comment);

        messageResponse = new MessageResponse();
        message = new Message();
        message.getContent().put("message", "Create new comment successfully");
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse updateCommentById(long commentId, Comment comment, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        Message message;

        messageResponse = commentValidation.checkCommentIsExist(commentId);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = commentValidation.validateComment(comment, GroupCommentUpdate.class);
        if(messageResponse != null)
            return messageResponse;

        Comment commentIsSelected = commentRepository.findById(commentId).get();
        commentIsSelected.setUpdatedAt(new Date());
        commentIsSelected.setMessage(comment.getMessage());
        commentRepository.save(commentIsSelected);

        message = new Message();
        message.getContent().put("message", "Update comment successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

    @Override
    public MessageResponse deleteCommentById(long commentId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        Message message;

        messageResponse = commentValidation.checkCommentIsExist(commentId);
        if(messageResponse != null)
            return messageResponse;

        commentRepository.deleteById(commentId);

        message = new Message();
        message.getContent().put("message", "Delete comment successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(message.getContent());
        return messageResponse;
    }

}
