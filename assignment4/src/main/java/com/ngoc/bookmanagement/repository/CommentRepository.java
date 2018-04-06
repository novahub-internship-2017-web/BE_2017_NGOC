package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Comment;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface CommentRepository extends CrudRepository<Comment, Long> {
    List<Comment> getAllByBookId(long bookId);
    Comment getCommentById(long bookId);
    boolean existsCommentById(long commentId);
    long countById(long commentId);
}
