package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.BookCoverService;
import com.ngoc.bookmanagement.service.BookService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@RestController
public class BookRestController {

    private static final Logger logger = Logger.getLogger(BookRestController.class);

    @Autowired
    private BookService bookService;

    @Autowired
    private BookCoverService bookCoverService;

    @GetMapping("/bookrest")
    public ResponseEntity bookListGet(HttpServletRequest request){

        logger.info(request.getRequestURI() + ", method = GET");

        long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
        List<Book> books = reverseArrayList(bookService.list(id));

        return new ResponseEntity(books, HttpStatus.OK);
    }

    private ArrayList<Book> reverseArrayList(List<Book> oldBooks){
        ArrayList<Book> books = new ArrayList<Book>();

        for (int i = oldBooks.size() - 1; i >= 0; i--) {
            oldBooks.get(i).setUser(null);
            books.add(oldBooks.get(i));
        }

        return books;
    }

    @GetMapping("/bookrest/{id}")
    public ResponseEntity bookGet(@PathVariable("id") long id, HttpServletRequest request){
        Book book = bookService.get(id);
        book.setUser(null);

        if(book == null){
            return new ResponseEntity("No Boo found for ID + " + id, HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity(book, HttpStatus.OK);
    }

    @PostMapping("/bookrest/search")
    public String bookSearch(@RequestParam("wordsSearch") @Nullable String words,
                             RedirectAttributes redirectAttributes,
                             HttpServletRequest request)
    {
        long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
        List<Book> books = reverseArrayList(bookService.list(id, words));
        redirectAttributes.addFlashAttribute(Constant.bookListAttribute, books);
        redirectAttributes.addFlashAttribute(Constant.wordsSearch, words);
        return "redirect:/book";
    }
}
