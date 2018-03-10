package com.ngoc.bookmanagement.model;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "book")
public class Book implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @NotBlank(message = "Title isn't blank")
    @Column(name = "title")
    @Length(max = 200, message = "Title contains maximum 200 characters")
    private String title;

    @NotBlank(message = "Author isn't blank")
    @Column(name = "author")
    @Length(max = 50, message = "Author contains maximum 50 characters")
    private String author;

    @Column(name = "description")
    @Length(max = 1000, message = "Description contains maximum 1000 characters")
    private String description;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at", nullable = false)
    private Date created_at;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "updated_at", nullable = false)
    private Date updated_at;

    @Column(name = "user_id")
    private long user_id;

    @ManyToOne(fetch =  FetchType.EAGER)
    @JoinColumn(name = "user_id", insertable = false, updatable = false, nullable = false)
    private User user;

    @Column(name = "bookCover_id")
    private long bookCover_id;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "bookCover_id", insertable = false, updatable = false, nullable = true)
    private BookCover bookCover;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreated_at() {
        return created_at;
    }

    public void setCreated_at(Date created_at) {
        this.created_at = created_at;
    }

    public Date getUpdated_at() {
        return updated_at;
    }

    public void setUpdated_at(Date updated_at) {
        this.updated_at = updated_at;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public User getUser() {
        return user;
}

    public void setUser(User user) {
        this.user = user;
    }

    public long getBookCover_id() {
        return bookCover_id;
    }

    public void setBookCover_id(long bookCover_id) {
        this.bookCover_id = bookCover_id;
    }

    public BookCover getBookCover() {
        return bookCover;
    }

    public void setBookCover(BookCover bookCover) {
        this.bookCover = bookCover;
    }

    public Book() {
        super();
    }

    public Book(String title, String author, String description) {
        this.title = title;
        this.author = author;
        this.description = description;
    }

    public Book(String title, String author, Date created_at, Date updated_at) {
        this.title = title;
        this.author = author;
        this.created_at = created_at;
        this.updated_at = updated_at;
    }

    public Book(String title, String author, Date created_at, Date updated_at, long user_id) {
        this.title = title;
        this.author = author;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
    }

    public Book(String title, String author, String description, Date created_at, Date updated_at, long user_id) {
        this.title = title;
        this.author = author;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
    }

    public Book(String title, String author, String description, Date created_at, Date updated_at, long user_id, User user) {
        this.title = title;
        this.author = author;
        this.description = description;
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
        this.user = user;
    }

    public Book(Date created_at, Date updated_at, long user_id) {
        this.created_at = created_at;
        this.updated_at = updated_at;
        this.user_id = user_id;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", description='" + description + '\'' +
                ", user_id=" + user_id +
                '}';
    }
}
