package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class BookValidationImpl implements BookValidation{
    @Autowired
    private BookRepository bookRepository;

    public MessageResponse checkBookIsExist(long bookId){
        MessageResponse messageResponse = null;
        Message message;

        if(!bookRepository.existsById(bookId)){
            message = new Message();
            message.getContent().put("message", "Book is not exist");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_NOT_EXIST);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

    @Override
    public MessageResponse checkBookIsLocked(long bookId) {

        MessageResponse messageResponse = null;
        Book book = bookRepository.findById(bookId).get();

        if(!book.getEnabled()){
            Message message = new Message();
            message.getContent().put("message", "Book is blocked");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_BLOCKED);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }
}
