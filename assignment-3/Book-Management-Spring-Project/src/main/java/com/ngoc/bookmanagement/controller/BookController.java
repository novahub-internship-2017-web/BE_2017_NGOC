package com.ngoc.bookmanagement.controller;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.BookCover;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.service.BookCoverService;
import com.ngoc.bookmanagement.service.BookService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class BookController {
    private static final Logger logger = Logger.getLogger(BookController.class);

    @Autowired
    private BookService bookService;

    @Autowired
    private BookCoverService bookCoverService;

    @GetMapping("/book")
    public String bookListTestGet(HttpServletRequest request){
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());
        return "bookList";
    }

    @GetMapping("/book/{id}")
    public String bookGet(@PathVariable("id") long id, HttpServletRequest request){
        logger.info(request.getRequestURI() + ", method = GET");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        Book book = bookService.get(id);

        request.setAttribute(Constant.bookAttribute, book);
        request.setAttribute(Constant.bookCoverUrlAttribute, book.getBookCover().getUrl());

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
                               @RequestParam("bookCoverImage") @Nullable MultipartFile bookCoverFile,
                               BindingResult result,
                               HttpServletRequest request,
                               Model model) {
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        if(!result.hasErrors()){


            Book oldBook = bookService.get(id);
            BookCover bookCover = oldBook.getBookCover();

            GetBookCoverFromRequestParam(bookCoverFile, bookCover, id, request);

            bookCoverService.update(bookCover.getId(), bookCover);

            oldBook.setAuthor(book.getAuthor());
            oldBook.setTitle(book.getTitle());
            oldBook.setDescription(book.getDescription());
            oldBook.setUpdated_at(new Date());
            oldBook.setBookCover(bookCover);
            request.setAttribute(Constant.bookAttribute, oldBook);
            model.addAttribute(Constant.bookAttribute, oldBook);
            bookService.update(id, oldBook);

            logger.info(request.getRequestURI() + ", method = POST, message = update book successfully");
            request.setAttribute(Constant.successMessageSession, "Update book successfully");
            request.setAttribute(Constant.bookCoverUrlAttribute, oldBook.getBookCover().getUrl());
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
                              @RequestParam("bookCoverImage") @Nullable MultipartFile bookCoverFile,
                              HttpServletRequest request,
                              RedirectAttributes redirectAttributes){
        logger.info(request.getRequestURI() + ", method = POST");
        request.setAttribute(Constant.urlRewriteAttribute, request.getRequestURI());

        long userId = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();

        Date now = new Date();
        book.setCreated_at(now);
        book.setUpdated_at(now);
        book.setUser_id(userId);

        long bookId = bookService.save(book);
        BookCover bookCover = new BookCover();
        long bookCoverId;

        GetBookCoverFromRequestParam(bookCoverFile, bookCover, bookId, request);

        bookCover.setBook_id(bookId);
        bookCoverId = bookCoverService.save(bookCover);
        book.setBookCover(bookCover);
        book.setBookCover_id(bookCoverId);
        bookService.update(bookId, book);

        logger.info(request.getRequestURI() + ", method = POST, message = Create a new book successfully");
        redirectAttributes.addFlashAttribute(Constant.successMessageSession, "Create a new book successfully");
        return "redirect:/book/" + bookId;
    }

    void GetBookCoverFromRequestParam(MultipartFile bookCoverFile, BookCover bookCover, long bookId, HttpServletRequest request)
    {
        if(bookCoverFile.getSize() > 0) {
            try {
                String fileName = bookCoverFile.getOriginalFilename();
                String urlProject = request.getServletContext().getRealPath("/");
                String urlFiles = urlProject + "images" + File.separator + "book-covers";
                String typeOfFile = fileName.substring(fileName.lastIndexOf("."));

                File folder = new File(urlFiles);
                if (!folder.exists())
                    folder.mkdir();

                File file = new File(urlFiles, bookId + typeOfFile);

                bookCoverFile.transferTo(file);
                logger.info("Upload book " + bookId + " successfully!!!");

                bookCover.setFile(bookCoverFile);
                bookCover.setUrl(File.separator + "book-covers" + File.separator + bookId + typeOfFile);

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
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

    private ArrayList<Book> reverseArrayList(List<Book> oldBooks){
        ArrayList<Book> books = new ArrayList<Book>();

        for (int i = oldBooks.size() - 1; i >= 0; i--) {
            oldBooks.get(i).setUser(null);
            books.add(oldBooks.get(i));
        }

        return books;
    }
}
