package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Book;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository
@Transactional(readOnly = true)
public class BookRepositoryImpl implements BookRepository{

    @Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public Book get(long id) {
        return sessionFactory.getCurrentSession().get(Book.class, id);
    }

    @Transactional
    public List<Book> list() {
        Session session = sessionFactory.getCurrentSession();

        Query<Book> query = session.createQuery("SELECT book FROM Book book JOIN User user ON book.user_id = user.id WHERE user.status = :status", Book.class);
        query.setParameter("status", true);
        List<Book> bookList = query.list();

        return bookList;
    }

    @Transactional
    public List<Book> list(long id) {
        Session session = sessionFactory.getCurrentSession();

        Query<Book> query = session.createQuery("SELECT book FROM Book book JOIN User user ON book.user_id = user.id WHERE user.id = :id", Book.class);
        query.setParameter("id", id);
        List<Book> bookList = query.list();

        return bookList;

    }

    @Transactional
    public List<Book> list(long id, String text)
    {
        Session session = sessionFactory.getCurrentSession();
        List<Book> bookList = null;

        if(!text.equals("")) {
            Query<Book> query = session.createQuery("SELECT book FROM Book book JOIN User user ON book.user_id = user.id WHERE user.id = :id AND (book.title LIKE :title OR book.author LIKE :author)", Book.class);
            query.setParameter("id", id);
            query.setParameter("title", "%" + text + "%");
            query.setParameter("author", "%" + text + "%");

            bookList = query.list();
        }
        else{
            bookList = list(id);
        }

        return bookList;
    }

    @Transactional
    public void update(long id,Book book) {
        Session session = sessionFactory.getCurrentSession();
        Book bookUpdating = session.get(Book.class, id);
        bookUpdating.setTitle(book.getTitle());
        bookUpdating.setAuthor(book.getAuthor());
        bookUpdating.setDescription(book.getDescription());
        bookUpdating.setUpdated_at(book.getUpdated_at());
        session.flush();
    }

    @Transactional
    public long save(Book book) {
        sessionFactory.getCurrentSession().save(book);
        return book.getId();
    }

    @Transactional
    public void delete(long id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = session.byId(Book.class).load(id);
        session.delete(book);
    }
}
