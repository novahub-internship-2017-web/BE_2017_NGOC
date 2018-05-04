package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.MessageResponse;
import org.springframework.data.domain.Pageable;

import javax.servlet.http.HttpServletRequest;

public interface BookService {

    MessageResponse getAllBooks(String wordsSearch, HttpServletRequest request, Pageable pageable);

    MessageResponse getAllBooksOfUser(String wordSearch, long userId, HttpServletRequest request, Pageable pageable);

    MessageResponse getAllBooksOfUserByEnabled(String wordSearch, long userId, HttpServletRequest request, boolean enabled, Pageable pageable);

    MessageResponse getAllBooksByEnabled(String wordsSearch, HttpServletRequest request, boolean enabled, Pageable pageable);

    MessageResponse getBook(long bookId, HttpServletRequest request);

    MessageResponse getAllBooksWithDisabledBookOfUser(String wordSeard, long userId, HttpServletRequest request, Pageable pageable);

    MessageResponse createBook(Book book, HttpServletRequest request);

    MessageResponse updateBook(long bookId, Book book, HttpServletRequest request);

    MessageResponse lockBook(long bookId, HttpServletRequest request);

    MessageResponse unlockBook(long bookId, HttpServletRequest request);

    MessageResponse deleteBook(long bookId, HttpServletRequest request);

}
