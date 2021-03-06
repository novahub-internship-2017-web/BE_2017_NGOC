package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.constant.RoleConstant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.service.BookService;
import com.ngoc.bookmanagement.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@RestController
public class BookController {

    private static final Logger logger = LoggerFactory.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

    @Autowired
    private UserService userService;

    @Autowired
    private BookRepository bookRepository;

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

    // TODO : Write an API to Get all books + my book wich is disabled

    // API for ROLE : ADMIN
    // API get all books like author or title
    @GetMapping(value = "/api/books", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooks(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "") String wordsSearch,
                                         HttpServletRequest request,
                                         @SessionAttribute("userLogin") @Nullable User userLogin,
                                         Pageable pageable){
        MessageResponse messageResponse;

        if(!checkAdminPermission(userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.getAllBooks(wordsSearch, request, pageable);
        
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : ADMIN
    // Required login
    // API get all books like author or title + all disabled book of user {userId}
    @GetMapping(value = "/api/books/user/{userId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksWithDisabledBookOfUser(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "") String wordsSearch,
                                                               @PathVariable("userId") long userId,
                                                               HttpServletRequest request,
                                                               @SessionAttribute("userLogin") @Nullable User userLogin,
                                                               Pageable pageable){
        MessageResponse messageResponse;

        if(!checkTrueUserOrAdminPermission(userId, userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.getAllBooksWithDisabledBookOfUser(wordsSearch, userId, request, pageable);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : USER | ADMIN
    // API get all books of user by userId with wordsSearch
    @GetMapping(value = "/api/user/{userId}/books", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksOfUser(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "")  String wordsSearch,
                                               @PathVariable("userId") long userId,
                                               HttpServletRequest request,
                                               @SessionAttribute("userLogin") User userLogin,
                                               Pageable pageable){
        MessageResponse messageResponse;

        if(!checkTrueUserOrAdminPermission(userId, userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else 
            messageResponse = bookService.getAllBooksOfUser(wordsSearch, userId, request, pageable);
        
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : USER | ADMIN | GUEST
    // API get all books of user by userId with wordsSearch, enable status
    @GetMapping(value = "/api/user/{userId}/books/enabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksEnabledOfUser(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "")  String wordsSearch,
                                               @PathVariable("userId") long userId,
                                               HttpServletRequest request,
                                               @SessionAttribute("userLogin") User userLogin,
                                               Pageable pageable){
        MessageResponse messageResponse;
        messageResponse = bookService.getAllBooksOfUserByEnabled(wordsSearch, userId, request, true, pageable);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : USER | ADMIN
    // API get all books of user by userId with wordsSearch, enable status
    @GetMapping(value = "/api/user/{userId}/books/disabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksDisabledOfUser(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "")  String wordsSearch,
                                                      @PathVariable("userId") long userId,
                                                      HttpServletRequest request,
                                                      @SessionAttribute("userLogin") User userLogin,
                                                      Pageable pageable){
        MessageResponse messageResponse;
        if(!checkTrueUserOrAdminPermission(userId, userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.getAllBooksOfUserByEnabled(wordsSearch, userId, request, false, pageable);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : USER | ADMIN | GUEST
    // API get all books, which is enabled
    @GetMapping(value = "/api/books/enabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksEnabled(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "")  String wordsSearch,
                                                HttpServletRequest request,
                                                Pageable pageable){
        wordsSearch = "%" + wordsSearch + "%";
        MessageResponse messageResponse = bookService.getAllBooksByEnabled(wordsSearch, request, true, pageable);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE : ADMIN
    // API get all books, which is disabled
    @GetMapping(value = "/api/books/disabled", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getAllBooksDisabled(@RequestHeader(value = "wordsSearch", required = false, defaultValue = "")  String wordsSearch,
                                                 HttpServletRequest request,
                                                 Pageable pageable){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkAdminPermission(userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else{
            wordsSearch = "%" + wordsSearch + "%";
            messageResponse = bookService.getAllBooksByEnabled(wordsSearch, request, false, pageable);
        }

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE: USER | ADMIN | GUEST
    // But GUEST can get book which isn't locked
    // API get a book
    @GetMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> getBook(@PathVariable("bookId") long bookId,
                                     HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkPermissionWhenGettingBook(bookId, userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.getBook(bookId, request);

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE: USER | ADMIN
    // Required login
    // API create a book
    @PostMapping(value = "/api/book", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> createBook(@RequestBody Book bookParam,
                                        HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkLogin(userLogin)){
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
            return new ResponseEntity<>(messageResponse, HttpStatus.OK);
        }

        if(userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN)){
            messageResponse = bookService.createBook(bookParam, request, true);
        } else {
            messageResponse = bookService.createBook(bookParam, request, false);
        }

        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE: USER | ADMIN
    // Required login
    // API update book
    @PutMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateBook(@PathVariable("bookId") long bookId,
                                        @RequestBody Book bookParam,
                                        HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkTrueUserOrAdminPermissionWhenUpdateBook(bookId, userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.updateBook(bookId, bookParam, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE: ADMIN
    // API update enable (false) of book - lock book
    @PutMapping(value = "/api/book/{bookId}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockBook(@PathVariable("bookId") long bookId,
                                      HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkAdminPermission(userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.lockBook(bookId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    // API for ROLE: ADMIN
    // API update enable (true) of book - unlock book
    @PutMapping(value = "/api/book/{bookId}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockBook(@PathVariable("bookId") long bookId,
                                        HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkAdminPermission(userLogin))
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        else
            messageResponse = bookService.unlockBook(bookId, request);
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    @DeleteMapping(value = "/api/book/{bookId}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> deleteBook(@PathVariable("bookId") long bookId,
                                        HttpServletRequest request){
        MessageResponse messageResponse;
        User userLogin = userService.getUserLoginInSession(request);

        if(!checkPermissionWhenDeletingBook(bookId, userLogin)){
            messageResponse = new MessageResponse(MessageResponseConstant.ACCESS_DENIED);
        } else {
            messageResponse = bookService.deleteBook(bookId, request);
        }
        return new ResponseEntity<>(messageResponse, HttpStatus.OK);
    }

    private boolean checkLogin(User userLogin){
        return (userLogin != null);
    }

    private boolean checkAdminPermission(User userLogin){

        if(!checkLogin(userLogin))
            return false;

        return  userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN);
    }

    private boolean checkTrueUserOrAdminPermission(long userId, User userLogin){

        if(!checkLogin(userLogin))
            return false;

        if(userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN))
            return true;

        return (userId == userLogin.getId());
    }

    private boolean checkTrueUserOrAdminPermissionWhenUpdateBook(long bookId, User userLogin){

        if(!checkLogin(userLogin))
            return false;

        if(userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN))
            return true;

        Book book = bookRepository.findById(bookId).get();
        return (book.getUserId() == userLogin.getId());
    }

    private boolean checkPermissionWhenGettingBook(long bookId, User userLogin){

        if(!checkLogin(userLogin))
            return false;

        // When book is locked, user create book or admin have permission to access
        Book book = bookRepository.findById(bookId).get();
        if(!book.getEnabled()){
            return ((userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN))
                || (userLogin.getId() == book.getUserId()));
        }

        return true;
    }

    private boolean checkPermissionWhenDeletingBook(long bookId, User userLogin){
        if(!checkLogin(userLogin))
            return false;

        Book book = bookRepository.findById(bookId).get();
        if(book.getUserId() == userLogin.getId()){
            return true;
        } else {
            return  userLogin.getRole().getName().equals(RoleConstant.ROLE_ADMIN);
        }
    }
}
