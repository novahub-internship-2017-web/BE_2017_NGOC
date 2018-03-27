package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.BookCover;

import java.util.List;

public interface BookCoverService {

    BookCover get(long id);

    List<BookCover> list();

    void update(long id, BookCover bookCover);

    long save(BookCover bookCover);

    void delete(long id);
}
