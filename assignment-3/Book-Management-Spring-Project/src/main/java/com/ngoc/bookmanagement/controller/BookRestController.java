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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@RestController
public class BookRestController {
    private static final Logger logger = Logger.getLogger(BookController.class);

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

    @PostMapping(value = "/bookList")
    public ResponseEntity bookSearch(@RequestParam("wordsSearch") @Nullable String words,
                                    RedirectAttributes redirectAttributes,
                                    HttpServletRequest request)
    {
        long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
        List<Book> books = reverseArrayList(bookService.list(id, words));
        redirectAttributes.addFlashAttribute(Constant.bookListAttribute, books);
        redirectAttributes.addFlashAttribute(Constant.wordsSearch, words);
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

    @PostMapping("/bookthu")
    public ResponseEntity bookNewRestPost(@ModelAttribute @Valid Book book,
                                  @RequestParam("bookCoverImage") @Nullable MultipartFile bookCoverFile,
                                  HttpServletRequest request){
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

        Book thisBook = bookService.get(bookId);

        logger.info(request.getRequestURI() + ", method = POST, message = Create a new book successfully");
        return new ResponseEntity(thisBook, HttpStatus.OK);
    }

    void GetBookCoverFromRequestParam(MultipartFile bookCoverFile, BookCover bookCover, long bookId, HttpServletRequest request)
    {
        if(bookCoverFile != null){
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
    }

}
