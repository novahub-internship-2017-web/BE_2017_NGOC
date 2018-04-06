package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;

@RestController
public class BookRestfulAPI {

    @Autowired
    private BookRepository bookRepository;

    // API get all books
    @GetMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooks(){
        Iterator<Book> bookIterator = bookRepository.findAll().iterator();

        ArrayList<Book> bookList = new ArrayList<>();
        while (bookIterator.hasNext()){
            bookList.add(bookIterator.next());
        }

        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    // API get a book
    @GetMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getBook(@PathVariable("bookId") long bookId){

        Message message = new Message();

        if(!bookRepository.existsBookById(bookId)) {
            message.getContent().put("message", "Book isn't exist");
            return new ResponseEntity<>(message.getContent(), HttpStatus.NOT_FOUND);
        }

        if(!bookRepository.findById(bookId).get().getEnabled()){
            message.getContent().put("message", "Book is blocked");
            return new ResponseEntity<>(message.getContent(), HttpStatus.LOCKED);
        }

        Book bookIsGetted = bookRepository.findById(bookId).get();
        return new ResponseEntity<>(bookIsGetted, HttpStatus.OK);
    }

    // API create a book
    @PostMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createBook(@RequestBody Book bookParam){
        bookParam.setCreatedAt(new Date());
        bookParam.setUpdatedAt(new Date());
        bookRepository.save(bookParam);

        Message message = new Message();
        message.getContent().put("message", "Create a new book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
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

        return new ResponseEntity<>(bookIsSelected, HttpStatus.OK);

    }

    @PutMapping(value = "/api/book/{id}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockBook(@PathVariable("id") long id){
        Book bookIsSelected = bookRepository.findById(id).get();
        bookIsSelected.setEnabled(false);
        bookRepository.save(bookIsSelected);

        Message message = new Message();
        message.getContent().put("message", "Lock book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

    @PutMapping(value = "/api/book/{id}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockBook(@PathVariable("id") long id){
        Book bookIsSelected = bookRepository.findById(id).get();
        bookIsSelected.setEnabled(true);
        bookRepository.save(bookIsSelected);

        Message message = new Message();
        message.getContent().put("message", "Unlock book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}
