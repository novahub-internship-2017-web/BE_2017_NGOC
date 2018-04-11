package com.ngoc.bookmanagement.service;

import org.springframework.http.ResponseEntity;
import com.ngoc.bookmanagement.model.MessageResponse;
import javax.servlet.http.HttpServletRequest;

public interface BookService {

    MessageResponse getAllBooks(String wordsSearch, HttpServletRequest request);

    MessageResponse getAllBooksOfUser(String wordSearch, long userId, HttpServletRequest request);

    MessageResponse getAllBooksEnabled(HttpServletRequest request);

    MessageResponse getBook(long bookId, HttpServletRequest request);
}
