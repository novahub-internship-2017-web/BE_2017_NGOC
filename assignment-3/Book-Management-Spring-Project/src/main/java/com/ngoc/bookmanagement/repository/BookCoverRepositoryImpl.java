package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.BookCover;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import org.hibernate.query.Query;
import java.util.List;

@Repository
@Transactional(readOnly = true)
public class BookCoverRepositoryImpl implements BookCoverRepository {

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public BookCover get(long id) {
        return sessionFactory.getCurrentSession().get(BookCover.class, id);
    }

    @Transactional
    public List<BookCover> list() {
        Session session = sessionFactory.getCurrentSession();

        Query<BookCover> query = session.createQuery("", BookCover.class);
        List<BookCover> bookCoverList = query.list();

        return bookCoverList;
    }

    @Transactional
    public void update(long id, BookCover bookCover) {
        Session session = sessionFactory.getCurrentSession();
        BookCover bookCoverUpdating = session.get(BookCover.class, id);
        bookCoverUpdating.setUrl(bookCover.getUrl());
        session.flush();
    }

    @Transactional
    public long save(BookCover bookCover) {
        sessionFactory.getCurrentSession().save(bookCover);
        return bookCover.getId();
    }

    @Transactional
    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        BookCover bookCover = session.byId(BookCover.class).load(id);
        session.delete(bookCover);
    }
}
