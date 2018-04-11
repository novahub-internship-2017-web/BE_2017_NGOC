package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.MessageResponse;
import javax.servlet.http.HttpServletRequest;

public interface BookService {

    MessageResponse getAllBooks(String wordsSearch, HttpServletRequest request);

    MessageResponse getAllBooksOfUser(String wordSearch, long userId, HttpServletRequest request);

    MessageResponse getAllBooksByEnabled(HttpServletRequest request, boolean enabled);

    MessageResponse getBook(long bookId, HttpServletRequest request);

    MessageResponse createBook(Book book, HttpServletRequest request);

    MessageResponse updateBook(long bookId, Book book, HttpServletRequest request);

    MessageResponse lockBook(long bookId, HttpServletRequest request);

    MessageResponse unlockBook(long bookId, HttpServletRequest request);

}
