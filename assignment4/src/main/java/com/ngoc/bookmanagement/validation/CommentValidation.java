package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.MessageResponse;

public interface CommentValidation {

    MessageResponse checkCommentIsExist(long commentId);

    MessageResponse validateComment(Comment comment, Class classValidation);

}
