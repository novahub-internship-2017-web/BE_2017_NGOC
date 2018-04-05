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
public class BookRestfulAPI {

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
        // TODO: check title is exist
        bookParam.setCreatedAt(new Date());
        bookParam.setUpdatedAt(new Date());
        bookRepository.save(bookParam);

        Message message;

        message = new Message("Create a new book successfully");

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    @PutMapping(value = "/api/book/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateBook(@PathVariable("id") long id, @RequestBody Book bookParam){
        // TODO: check duplication title
        Book bookIsSelected = bookRepository.findById(id).get();

        bookIsSelected.setUpdatedAt(new Date());
        bookIsSelected.setTitle(bookParam.getTitle());
        bookIsSelected.setAuthor(bookParam.getAuthor());
        bookIsSelected.setDescription(bookParam.getDescription());

        bookRepository.save(bookIsSelected);

        return new ResponseEntity<Book>(bookIsSelected, HttpStatus.OK);

    }

    @PutMapping(value = "/api/book/{id}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockBook(@PathVariable("id") long id){
        Book bookIsSelected = bookRepository.findById(id).get();
        bookIsSelected.setEnabled(false);
        bookRepository.save(bookIsSelected);

        Message message;
        message = new Message("Lock book successfully");

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    @PutMapping(value = "/api/book/{id}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockBook(@PathVariable("id") long id){
        Book bookIsSelected = bookRepository.findById(id).get();
        bookIsSelected.setEnabled(true);
        bookRepository.save(bookIsSelected);

        Message message;
        message = new Message("Unlock book successfully");

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
