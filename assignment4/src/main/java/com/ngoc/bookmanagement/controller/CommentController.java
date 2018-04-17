package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.validation.*;

@RestController
public class CommentController {

    // TODO: add code to validate create comment with book (is disabled)

    @Autowired
    private CommentService commentService;

    // API get a comment by commentId
    @GetMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getComment(@PathVariable("commentId") long commentId,
                                        HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = commentService.getCommentById(commentId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API get all comments of book by bookId
    @GetMapping(value = "/api/book/{bookId}/comments", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllCommentOfBook(@PathVariable("bookId") long bookId,
                                                 HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = commentService.getAllCommentsByBookId(bookId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API create new comment for book, which rely on bookId
    @PostMapping(value = "/api/book/{bookId}/comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createComment(@PathVariable("bookId") long bookId,
                                           @RequestBody Comment commentParam,
                                           HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = commentService.createCommentOfBookByBookId(bookId, commentParam, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API update a comment, which rely on commentId
    @PutMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateComment(@PathVariable("commentId") long commentId,
                                           @RequestBody Comment commentParam,
                                           HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = commentService.updateCommentById(commentId, commentParam, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API delete a comment, which rely on commentId
    @DeleteMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> deleteComment(@PathVariable("commentId") long commentId,
                                           HttpServletRequest request){
        // TODO: validate
        MessageResponse messageResponse = commentService.deleteCommentById(commentId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

}
