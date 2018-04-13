package com.ngoc.bookmanagement.validation;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.validation.*;
import java.util.Set;

@Component
public class BookValidationImpl implements BookValidation{

    @Autowired
    private BookRepository bookRepository;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    public MessageResponse checkBookIsExist(long bookId){
        MessageResponse messageResponse = null;
        //Message message;

        if(!bookRepository.existsById(bookId)){
            //message = new Message();
            //message.getContent().put("message", "Book is not exist");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_NOT_EXIST);
            //messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

    @Override
    public MessageResponse checkBookIsLocked(long bookId) {

        MessageResponse messageResponse = null;
        Book book = bookRepository.findById(bookId).get();

        if(!book.getEnabled()){
            //Message message = new Message();
            //message.getContent().put("message", "Book is blocked");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_BLOCKED);
            //messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }

    @Override
    public MessageResponse validateBook(Book book, Class classValidation) {

        MessageResponse messageResponse = null;
        Message message = new Message();

        Set<ConstraintViolation<Book>> constraintViolations = validator.validate(book, classValidation);

        if(constraintViolations.size() > 0){
            for(ConstraintViolation<Book> commentConstraintViolation : constraintViolations){
                message.getContent().put(commentConstraintViolation.getPropertyPath().toString(), commentConstraintViolation.getMessage());
            }

            messageResponse.setCode(MessageResponseConstant.BOOK_ERROR_VALIDATION);
            messageResponse.setObject(message.getContent());
        }

        return messageResponse;
    }
}
