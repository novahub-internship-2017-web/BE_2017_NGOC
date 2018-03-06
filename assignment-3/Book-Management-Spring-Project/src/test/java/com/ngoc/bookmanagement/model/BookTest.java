package com.ngoc.bookmanagement.model;

import org.junit.Before;
import org.junit.Test;

import java.util.Date;

import static org.junit.Assert.*;

public class BookTest {

    private Book book;

    @Before
    public void setUp() throws Exception {
        book = new Book();
        book.setId(1);
        book.setTitle("Title book");
        book.setAuthor("Author book");
        book.setDescription("Description book");
        book.setCreated_at(new Date());
        book.setUpdated_at(new Date());
        book.setUser_id(23);
    }

    @Test
    public void getId() {
        assertEquals(1, book.getId());
    }

    @Test
    public void setId() {
        book.setId(2);
        assertEquals(2, book.getId());
    }

    @Test
    public void getTitle() {
        assertEquals("Title book", book.getTitle());
    }

    @Test
    public void setTitle() {
        book.setTitle("Harry poster");
        assertEquals("Harry poster", book.getTitle());
    }

    @Test
    public void getDescription() {
        assertEquals("Description book", book.getDescription());
    }

    @Test
    public void setDescription() {
        book.setDescription("Good book");
        assertEquals("Good book", book.getDescription());
    }

    @Test
    public void getUser_id() {
        assertEquals(23, book.getUser_id());
    }

    @Test
    public void setUser_id() {
        book.setUser_id(5);
        assertEquals(5, book.getUser_id());
    }

    @Test
    public void getAuthor() {
        assertEquals("Author book", book.getAuthor());
    }

    @Test
    public void setAuthor() {
        book.setAuthor("J. K. Rowling");
        assertEquals("J. K. Rowling", book.getAuthor());
    }

    @Test
    public void testToString() {
        assertEquals("Book{id=1, title='Title book', author='Author book', description='Description book', user_id=23}", book.toString());
    }
}