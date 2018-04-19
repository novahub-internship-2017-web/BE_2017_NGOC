package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.MessageResponse;
import org.springframework.data.domain.Pageable;

import javax.servlet.http.HttpServletRequest;

public interface CommentService {

    MessageResponse getCommentById(long commentId, HttpServletRequest request);

    MessageResponse getAllCommentsByBookId(long bookId, HttpServletRequest request, Pageable pageable);

    MessageResponse createCommentOfBookByBookId(long bookId, Comment comment, HttpServletRequest request);

    MessageResponse updateCommentById(long commentId, Comment comment, HttpServletRequest request);

    MessageResponse deleteCommentById(long commentId, HttpServletRequest request);
}
