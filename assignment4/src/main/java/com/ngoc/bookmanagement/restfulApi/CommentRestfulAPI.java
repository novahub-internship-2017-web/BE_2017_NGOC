package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;


@RestController
public class CommentRestfulAPI {

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private CommentRepository commentRepository;

    @GetMapping(value = "/api/comment/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getComment(@PathVariable("id") long id){
        Comment commentIsSelected = commentRepository.findById(id).get();

        return new ResponseEntity<Comment>(commentIsSelected, HttpStatus.OK);
    }

    @GetMapping(value = "/api/book/{id}/comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllCommentOfBook(@PathVariable("id") long id){
        List<Comment> commentList = commentRepository.getAllByBookId(id);

        return new ResponseEntity<List<Comment>>(commentList, HttpStatus.OK);
    }

    @PostMapping(value = "/api/book/{bookId}/comment", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createComment(@PathVariable("bookId") long bookId, @RequestBody Comment commentParam){
        // TODO : validate data

        commentParam.setCreatedAt(new Date());
        commentParam.setUpdatedAt(new Date());
        commentParam.setBookId(bookId);
        commentParam.setUserId(commentParam.getUserId());

        commentRepository.save(commentParam);

        return new ResponseEntity<Comment>(commentParam, HttpStatus.OK);
    }

    @PutMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateComment(@PathVariable("commentId") long commentId,
                                           @RequestBody Comment commentParam){
        // TODO : validate data
        Comment commentIsSelected = commentRepository.findById(commentId).get();
        commentIsSelected.setUpdatedAt(new Date());
        commentIsSelected.setContent(commentParam.getContent());

        commentRepository.save(commentIsSelected);

        return new ResponseEntity<Comment>(commentIsSelected, HttpStatus.OK);
    }

    @DeleteMapping(value = "/api/comment/{commentId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> deleteComment(@PathVariable("commentId") long commentId){
        // TODO : validate data
        commentRepository.deleteById(commentId);

        Message message = new Message();
        message.getContent().put("message", "Delete comment successfully");

        return new ResponseEntity<>(message, HttpStatus.OK);
    }



}
