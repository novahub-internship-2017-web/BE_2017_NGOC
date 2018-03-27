package com.ngoc.bookmanagement.model;

import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "BookCover")
public class BookCover implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private long id;

    @Column(name = "url", nullable = true)
    private String url = null;

    @Transient
    private MultipartFile file;

    @Column(name = "book_id")
    private long book_id;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public long getBook_id() {
        return book_id;
    }

    public void setBook_id(long book_id) {
        this.book_id = book_id;
    }

    public BookCover() {
    }

    public BookCover(String url) {
        this.url = url;
    }

    public BookCover(String url, MultipartFile file) {
        this.url = url;
        this.file = file;
    }

    public BookCover(String url, MultipartFile file, long book_id) {
        this.url = url;
        this.file = file;
        this.book_id = book_id;
    }

}
