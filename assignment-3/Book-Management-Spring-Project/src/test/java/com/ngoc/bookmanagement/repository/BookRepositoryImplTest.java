package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.configuration.AppConfig;
import com.ngoc.bookmanagement.configuration.MyWebInitializer;
import com.ngoc.bookmanagement.configuration.SpringWebConfig;
import com.ngoc.bookmanagement.model.Book;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.support.AnnotationConfigContextLoader;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = AppConfig.class, loader = AnnotationConfigContextLoader.class)
public class BookRepositoryImplTest {

    @Autowired
    private BookRepository bookRepository;

    private Book book;

    @Before
    public void setUp() throws Exception {
        Book book = new Book();
        book.setTitle("Title");
        book.setAuthor("Author");
        book.setDescription("Description");

        bookRepository.save(book);
    }

    @Test
    public void get() {
        Book newBook = bookRepository.get(1);
    }

    @Test
    public void list() {
    }

    @Test
    public void list1() {
    }

    @Test
    public void update() {
    }

    @Test
    public void save() {
    }

    @Test
    public void delete() {
    }
}