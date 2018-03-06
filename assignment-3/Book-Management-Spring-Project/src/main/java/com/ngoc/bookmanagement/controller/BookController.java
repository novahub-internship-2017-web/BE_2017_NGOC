package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.BookService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BookController {
    private static final Logger logger = Logger.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

    @GetMapping("/book")
    public String bookListGet(HttpServletRequest request){

        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
        List<Book> books = reverseArrayList(bookService.list(id));

        request.setAttribute(Constant.bookListAttribute, books);

        return "bookList";
    }

    private ArrayList<Book> reverseArrayList(List<Book> oldBooks){
        ArrayList<Book> books = new ArrayList<Book>();

        for (int i = oldBooks.size() - 1; i >= 0; i--) {
            books.add(oldBooks.get(i));
        }

        return books;
    }

    @GetMapping("/book/{id}")
    public String bookGet(@PathVariable("id") long id, HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        Book book = bookService.get(id);

        request.setAttribute(Constant.bookAttribute, book);

        return "bookDetails";
    }

    @GetMapping("/book/{id}/edit")
    public String bookEditGet(@PathVariable("id") long id,
                              HttpServletRequest request,
                              Model model){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        Book book = bookService.get(id);

        request.setAttribute(Constant.bookAttribute, book);
        model.addAttribute("book", book);

        return "bookEdit";
    }

    @PostMapping(value = "/book/{id}/edit")
    public String bookEditPost(@PathVariable("id") long id,
                               @ModelAttribute("book") @Valid Book book,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if(!result.hasErrors()){
            Book oldBook = bookService.get(id);
            oldBook.setAuthor(book.getAuthor());
            oldBook.setTitle(book.getTitle());
            oldBook.setDescription(book.getDescription());
            oldBook.setUpdated_at(new Date());
            request.setAttribute(Constant.bookAttribute, oldBook);
            model.addAttribute(Constant.bookAttribute, oldBook);
            bookService.update(id, oldBook);

            logger.info(request.getRequestURI() + ", method = POST, message = update book successfully");
            request.setAttribute(Constant.successMessageSession, "Update book successfully");

        }
        else{
            logger.info(request.getRequestURI() + ", method = POST, message = having errors about validation");
            request.setAttribute(Constant.errorMessageSession, "Having errors about validation");
        }

        return "bookEdit";
    }

    @GetMapping("/book/new")
    public String bookNewGet(Model model,
                             HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        model.addAttribute(Constant.bookAttribute, new Book());
        return "bookNew";
    }

    @PostMapping("/book/new")
    public String bookNewPost(@ModelAttribute("book") @Valid Book book,
                              HttpServletRequest request,
                              RedirectAttributes redirectAttributes){
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        Date now = new Date();
        book.setCreated_at(now);
        book.setUpdated_at(now);
        book.setUser_id(((User) request.getSession().getAttribute(Constant.userLoginSession)).getId());
        long bookId = bookService.save(book);

        logger.info(request.getRequestURI() + ", method = POST, message = Create a new book successfully");
        redirectAttributes.addFlashAttribute(Constant.successMessageSession, "Create a new book successfully");
        return "redirect:/book/" + bookId;
    }

    @GetMapping("/book/{id}/delete")
    public String bookDelete(@PathVariable("id") long id,
                             HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET, message = delete book which have id equal " + id);
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        bookService.delete(id);
        return "redirect:/book";
    }

    @PostMapping("/book/{id}/search")
    public String bookSearch(@PathVariable("id") long id,
                             @RequestParam("wordsSearch") @Nullable String words,
                             RedirectAttributes redirectAttributes)
    {
        List<Book> books = reverseArrayList(bookService.list(id, words));
        redirectAttributes.addFlashAttribute(Constant.bookListAttribute, books);
        redirectAttributes.addFlashAttribute(Constant.wordsSearch, words);
        return "redirect:/book";
    }
}
