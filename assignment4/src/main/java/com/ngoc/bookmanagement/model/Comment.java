package com.ngoc.bookmanagement.model;

import com.ngoc.bookmanagement.validation.GroupCommentCreate;
import com.ngoc.bookmanagement.validation.GroupCommentUpdate;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "comment")
public class Comment implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @Column(name = "book_id")
    @NotNull(groups = {GroupCommentCreate.class})
    private long bookId;

    @Column(name = "user_id")
    @NotNull(groups = {GroupCommentCreate.class})
    private long userId;

    @Temporal(TemporalType.TIME)
    @Column(name = "created_at")
    @NotNull
    private Date createdAt;

    @Temporal(TemporalType.TIME)
    @Column(name = "updated_at")
    @NotNull
    private Date updatedAt;

    @Column(name = "message")
    @NotEmpty(groups = {GroupCommentCreate.class, GroupCommentUpdate.class})
    private String message;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getBookId() {
        return bookId;
    }

    public void setBookId(long bookId) {
        this.bookId = bookId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "id=" + id +
                ", bookId=" + bookId +
                ", userId=" + userId +
                ", createdAt=" + createdAt +
                ", updatedAt=" + updatedAt +
                ", message='" + message + '\'' +
                '}';
    }
}
