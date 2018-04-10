package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class TestController {

    @Autowired
    private CommentRepository commentRepository;

    @Autowired
    private BookRepository bookRepository;

    @GetMapping(value = "/test")
    public String testGet(HttpServletRequest request){
        List<Book> bookList = bookRepository.getAllByUserIdAndAuthorLikeOrTitleLike(2, "%title%", "%title%");

        System.out.println(bookList);

        return "test";
    }

}
