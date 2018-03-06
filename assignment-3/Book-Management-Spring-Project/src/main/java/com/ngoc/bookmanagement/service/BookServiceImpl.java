package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class BookServiceImpl implements BookService {

    @Autowired
    private BookRepository bookRepository;

    public Book get(long id) {
        return bookRepository.get(id);
    }

    public List<Book> list() {
        return bookRepository.list();
    }

    public List<Book> list(long id){
        return bookRepository.list(id);
    }

    public List<Book> list(long id, String text) {
        return bookRepository.list(id, text);
    }

    public void update(long id, Book book) {
        bookRepository.update(id, book);
    }

    public long save(Book book) {
        bookRepository.save(book);
        return book.getId();
    }

    public void delete(long id) {
        bookRepository.delete(id);
    }
}
