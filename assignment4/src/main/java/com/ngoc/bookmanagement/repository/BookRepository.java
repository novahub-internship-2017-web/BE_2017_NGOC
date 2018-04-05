package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Book;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface BookRepository extends CrudRepository<Book, Long> {
    List<Book> getAllByEnabled(boolean enabled);
    List<Book> getAllByEnabledAndImage(boolean enabled, String image);
    boolean existsById(long id);
}
