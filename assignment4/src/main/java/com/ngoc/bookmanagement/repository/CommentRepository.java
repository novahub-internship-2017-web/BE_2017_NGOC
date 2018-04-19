package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Comment;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CommentRepository extends PagingAndSortingRepository<Comment, Long> {

    Page<Comment> getAllByBookId(long bookId, Pageable pageable);

    Page<Comment> findAllByBookId(long bookId, Pageable pageable);

    Comment getCommentById(long bookId);

    boolean existsCommentById(long commentId);

    long countById(long commentId);

}
