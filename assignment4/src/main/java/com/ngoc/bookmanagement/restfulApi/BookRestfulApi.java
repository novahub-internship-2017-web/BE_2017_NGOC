package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;

@RestController
public class BookRestfulApi {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooks(){
        List<Book> bookList = bookRepository.getAllByEnabled(true);

        return new ResponseEntity<List<Book>>(bookList, HttpStatus.OK);
    }

    @GetMapping(value = "/api/book/id", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getBook(@PathVariable("id") long id){

        Message message;

        if(!bookRepository.existsById(id)) {
            message = new Message("Book isn't exist");
            return new ResponseEntity<Message>(message,HttpStatus.NOT_FOUND);
        }

        Book bookIsGetted = bookRepository.findById(id).get();

        return new ResponseEntity<Book>(bookIsGetted, HttpStatus.OK);
    }

    @PostMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createBook(@RequestBody Book bookParam){
        bookParam.setCreatedAt(new Date());
        bookParam.setUpdatedAt(new Date());
        bookRepository.save(bookParam);

        Message message;

        message = new Message("Create a new book successfully");

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    class Message{
        private String message;

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        public Message() {
        }

        Message(String message) {
            this.message = message;
        }
    }
}
