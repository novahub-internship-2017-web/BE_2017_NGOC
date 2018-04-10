package com.ngoc.bookmanagement.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {

    @GetMapping(value = "/book/new")
    public String bookGet(){
        return "create_book";
    }

    @GetMapping(value = "/books")
    public String allBooksGet(){
        return "book_all";
    }

    @GetMapping(value = "/books/{id}/edit")
    public String editBook(){
        return "book_edit";
    }
}
