package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Comment;
import org.springframework.data.repository.CrudRepository;

public interface CommentRepository extends CrudRepository<Comment, Long> {
}
