package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.*;

@RestController
public class BookRestfulAPI {

    private static final Logger logger = LoggerFactory.getLogger(BookRestfulAPI.class);

    @Autowired
    private BookRepository bookRepository;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    // API get all books like author or title
    @GetMapping(value = "/api/book/search", produces = {MediaType.APPLICATION_JSON_VALUE}, params = {"wordsSearch"})
    public ResponseEntity<?> getAllBooks(@RequestParam("wordsSearch") String wordSearch,
                                         HttpServletRequest request){
        log(request);
        wordSearch = "%" + wordSearch + "%";

        List<Book> bookList = bookRepository.getAllByAuthorLikeOrTitleLike(wordSearch, wordSearch);
        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    // API get all books
    @GetMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooks(HttpServletRequest request){
        log(request);
        Iterator<Book> bookIterator = bookRepository.findAll().iterator();

        ArrayList<Book> bookList = new ArrayList<>();
        while (bookIterator.hasNext()){
            bookList.add(bookIterator.next());
        }

        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    // API get all books, which is enabled
    @GetMapping(value = "/api/book/enabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksEnabled(HttpServletRequest request){
        log(request);
        List<Book> bookList = bookRepository.getAllByEnabled(true);

        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    // API get all books, which is disabled
    @GetMapping(value = "/api/book/disabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksDisabled(HttpServletRequest request){
        log(request);
        List<Book> bookList = bookRepository.getAllByEnabled(false);

        return new ResponseEntity<>(bookList, HttpStatus.OK);
    }

    // API get a book
    @GetMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getBook(@PathVariable("bookId") long bookId,
                                     HttpServletRequest request){
        log(request);
        Message message = new Message();

        if(!bookRepository.existsById(bookId)) {
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
    public ResponseEntity<?> createBook(@RequestBody Book bookParam,
                                        HttpServletRequest request){
        log(request);
        bookParam.setCreatedAt(new Date());
        bookParam.setUpdatedAt(new Date());
        bookRepository.save(bookParam);

        Message message = new Message();
        message.getContent().put("message", "Create a new book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

    // API update book
    @PutMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateBook(@PathVariable("bookId") long bookId, 
                                        @RequestBody Book bookParam,
                                        HttpServletRequest request){
        log(request);
        Book bookIsSelected = bookRepository.findById(bookId).get();

        bookIsSelected.setUpdatedAt(new Date());
        bookIsSelected.setTitle(bookParam.getTitle());
        bookIsSelected.setAuthor(bookParam.getAuthor());
        bookIsSelected.setDescription(bookParam.getDescription());

        bookRepository.save(bookIsSelected);

        return new ResponseEntity<>(bookIsSelected, HttpStatus.OK);

    }

    // API update enable (false) of book - lock book
    @PutMapping(value = "/api/book/{bookId}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockBook(@PathVariable("bookId") long bookId,
                                    HttpServletRequest request){
        log(request);
        Book bookIsSelected = bookRepository.findById(bookId).get();
        bookIsSelected.setEnabled(false);
        bookRepository.save(bookIsSelected);

        Message message = new Message();
        message.getContent().put("message", "Lock book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

    // API update enable (true) of book - unlock book
    @PutMapping(value = "/api/book/{bookId}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockBook(@PathVariable("bookId") long bookId,
                                        HttpServletRequest request){
        log(request);
        Book bookIsSelected = bookRepository.findById(bookId).get();
        bookIsSelected.setEnabled(true);
        bookRepository.save(bookIsSelected);

        Message message = new Message();
        message.getContent().put("message", "Unlock book successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}
