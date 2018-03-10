package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.BookCover;
import com.ngoc.bookmanagement.repository.BookCoverRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookCoverServiceImpl implements BookCoverService {

    @Autowired
    private BookCoverRepository bookCoverRepository;

    public BookCover get(long id) {
        return bookCoverRepository.get(id);
    }

    public List<BookCover> list() {
        return bookCoverRepository.list();
    }

    public void update(long id, BookCover bookCover) {
        bookCoverRepository.update(id, bookCover);
    }

    public long save(BookCover bookCover) {
        bookCoverRepository.save(bookCover);
        return bookCover.getId();
    }

    public void delete(long id) {
        bookCoverRepository.delete(id);
    }
}
