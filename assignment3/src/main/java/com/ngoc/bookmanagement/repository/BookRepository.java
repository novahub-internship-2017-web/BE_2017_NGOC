package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Book;

import java.util.List;

public interface BookRepository {

    Book get(long id);

    List<Book> list();

    List<Book> list(long id);

    List<Book> list(long id, String text);

    void update(long id,Book book);

    long save(Book book);

    void delete(long id);
}
