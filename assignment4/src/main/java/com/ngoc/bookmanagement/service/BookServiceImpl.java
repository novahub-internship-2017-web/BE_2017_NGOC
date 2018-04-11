package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);

    @Autowired
    private BookRepository bookRepository;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @Override
    public MessageResponse getAllBooks(String wordSearch, HttpServletRequest request) {
        log(request);
        // TODO: validate

        wordSearch = "%" + wordSearch + "%";
        List<Book> bookList = bookRepository.getAllByAuthorLikeOrTitleLike(wordSearch, wordSearch);

        MessageResponse messageResponse = new MessageResponse();
        if(bookList.size() == 0)
            messageResponse.setCode(MessageResponseConstant.OK);
        else
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    @Override
    public MessageResponse getAllBooksOfUser(String wordSearch, long userId, HttpServletRequest request) {
        log(request);
        // TODO: validate

        wordSearch = "%" + wordSearch + "%";
        List<Book> bookList = bookRepository.getAllByUserIdAndAuthorLikeOrTitleLike(userId, wordSearch, wordSearch);

        MessageResponse messageResponse = new MessageResponse();
        if(bookList.size() == 0)
            messageResponse.setCode(MessageResponseConstant.OK);
        else
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    @Override
    public MessageResponse getAllBooksEnabled(HttpServletRequest request){
        log(request);
        List<Book> bookList = bookRepository.getAllByEnabled(true);
        
        MessageResponse messageResponse = new MessageResponse();

        if(bookList.size() == 0){
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        } else {
            messageResponse.setCode(MessageResponseConstant.OK);
        }
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    @Override
    public MessageResponse getBook(long bookId, HttpServletRequest request) {
        log(request);
        MessageResponse messageResponse = new MessageResponse();
        Message message = new Message();

        if(!bookRepository.existsById(bookId)) {
            message.getContent().put("message", "Book isn't exist");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_NOT_EXIST);
            messageResponse.setObject(message);
            return messageResponse;
        }

        Book bookIsGetted = bookRepository.findById(bookId).get();
        User userLogin = (User) request.getSession().getAttribute("userLogin");


        if(!bookIsGetted.getEnabled()){
            message.getContent().put("message", "Book is blocked");

            messageResponse.setCode(MessageResponseConstant.BOOK_IS_BLOCKED);
            messageResponse.setObject(message);
            return messageResponse;
        }

        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(bookIsGetted);
        return messageResponse;
    }
}
