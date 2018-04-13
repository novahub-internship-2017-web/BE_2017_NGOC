package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.MessageResponse;

public interface BookValidation {

    MessageResponse checkBookIsExist(long bookId);

    MessageResponse checkBookIsLocked(long bookId);

    MessageResponse validateBook(Book book, Class classValidation);

}
