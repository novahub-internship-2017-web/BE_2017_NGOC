package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import com.ngoc.bookmanagement.validation.GroupCommentCreate;
import com.ngoc.bookmanagement.validation.GroupCommentUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.*;
import java.util.Date;
import java.util.List;
import java.util.Set;

@RestController
public class CommentRestfulAPI {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private BookRepository bookRepository;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    // API get a comment by commentId
    @GetMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getComment(@PathVariable("commentId") long commentId){

        Message message = new Message();
        if(!commentRepository.existsById(commentId)){
            message.getContent().put("message", "Comment isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }

        Comment commentIsSelected = commentRepository.getCommentById(commentId);
        return new ResponseEntity<>(commentIsSelected, HttpStatus.OK);
    }

    // API get all comments of book by bookId
    @GetMapping(value = "/api/book/{bookId}/comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllCommentOfBook(@PathVariable("bookId") long bookId){

        Message message = new Message();
        if(!bookRepository.existsById(bookId)){
            message.getContent().put("message", "Book isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }

        List<Comment> commentList = commentRepository.getAllByBookId(bookId);

        return new ResponseEntity<>(commentList, HttpStatus.OK);
    }

    // API create new comment for book, which rely on bookId
    @PostMapping(value = "/api/book/{bookId}/comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createComment(@PathVariable("bookId") long bookId, @RequestBody Comment commentParam){

        Message message = new Message();

        if(!bookRepository.existsById(bookId)){
            message.getContent().put("message", "Book isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }

        Set<ConstraintViolation<Comment>> constraintViolations = validator.validate(commentParam, GroupCommentCreate.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Comment> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_ACCEPTABLE);
        }

        commentParam.setCreatedAt(new Date());
        commentParam.setUpdatedAt(new Date());
        commentRepository.save(commentParam);

        return new ResponseEntity<>(commentParam, HttpStatus.OK);
    }

    // API update a comment, which rely on commentId
    @PutMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateComment(@PathVariable("commentId") long commentId,
                                           @RequestBody Comment commentParam){
        Message message = new Message();

        if(!commentRepository.existsById(commentId)){
            message.getContent().put("message", "Comment isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NO_CONTENT);
        }

        Set<ConstraintViolation<Comment>> constraintViolations = validator.validate(commentParam, GroupCommentUpdate.class);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Comment> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_ACCEPTABLE);
        }

        Comment commentIsSelected = commentRepository.findById(commentId).get();
        commentIsSelected.setUpdatedAt(new Date());
        commentIsSelected.setMessage(commentParam.getMessage());
        commentRepository.save(commentIsSelected);

        return new ResponseEntity<>(commentIsSelected, HttpStatus.OK);
    }

    // API delete a comment, which rely on commentId
    @DeleteMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> deleteComment(@PathVariable("commentId") long commentId){
        Message message = new Message();

        if(!commentRepository.existsById(commentId)){
            message.getContent().put("message", "Comment isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }

        commentRepository.deleteById(commentId);
        message.getContent().put("message", "Delete comment successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}