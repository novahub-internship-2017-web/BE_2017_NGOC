package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.service.BookService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@RestController
public class BookController {

    private static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private BookService bookService;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @RequestMapping(value = "/book/new")
    public ModelAndView bookGet(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("create_book");

        return modelAndView;
    }

    @RequestMapping(value = "/books")
    public ModelAndView allBooksGet(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("book_all");

        return modelAndView;
    }

    @RequestMapping(value = "/books/{id}/edit")
    public ModelAndView editBook(){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("book_edit");

        return modelAndView;
    }

    // API get all books like author or title
    @GetMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooks(@RequestHeader("wordSearch") @Nullable  String wordSearch,
                                         HttpServletRequest request){

        MessageResponse messageResponse = bookService.getAllBooks(wordSearch, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API get all books of user by userId
    @GetMapping(value = "/api/user/{userId}/book", produces = {MediaType.APPLICATION_JSON_VALUE}, params = {"wordsSearch"})
    public ResponseEntity<?> getAllBooksOfUser(@RequestHeader("wordSearch") @Nullable  String wordSearch,
                                               @PathVariable("userId") long userId,
                                               HttpServletRequest request){

        MessageResponse messageResponse = bookService.getAllBooksOfUser(wordSearch, userId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API get all books, which is enabled
    @GetMapping(value = "/api/book/enabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksEnabled(HttpServletRequest request){

        MessageResponse messageResponse = bookService.getAllBooksEnabled(request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
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
