package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.MessageResponseConstant;
import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.BookRepository;
import com.ngoc.bookmanagement.validation.BookValidation;
import com.ngoc.bookmanagement.validation.UserValidation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Service
public class BookServiceImpl implements BookService{

    private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);

    @Autowired
    private BookRepository bookRepository;

    @Autowired
    private UserValidation userValidation;

    @Autowired
    private BookValidation bookValidation;

    private static void log(HttpServletRequest request) {
        logger.info("URL : " + request.getRequestURL());
        logger.info("Method : " + request.getMethod());
        logger.info("IP : " + request.getRemoteAddr());
    }

    @Override
    public MessageResponse getAllBooks(String wordSearch, HttpServletRequest request) {
        log(request);

        wordSearch = (wordSearch == null) ? "" : "%" + wordSearch + "%";
        List<Book> bookList = bookRepository.getAllByAuthorLikeOrTitleLike(wordSearch, wordSearch);

        MessageResponse messageResponse = new MessageResponse();
        if(bookList.size() == 0)
            messageResponse.setCode(MessageResponseConstant.OK);
        else
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    // get all books of user (both enable and disable)
    @Override
    public MessageResponse getAllBooksOfUser(String wordSearch, long userId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        messageResponse = userValidation.checkUserIsExist(userId);
        if(messageResponse != null)
            return messageResponse;

        wordSearch = (wordSearch == null) ? "" : "%" + wordSearch + "%";
        List<Book> bookList = bookRepository.getAllByUserIdAndAuthorLikeOrTitleLike(userId, wordSearch, wordSearch);

        messageResponse = new MessageResponse();
        if(bookList.size() == 0)
            messageResponse.setCode(MessageResponseConstant.OK);
        else
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    @Override
    public MessageResponse getAllBooksOfUserByEnabled(String wordSearch, long userId, HttpServletRequest request, boolean enabled) {
        log(request);

        MessageResponse messageResponse;
        messageResponse = userValidation.checkUserIsExist(userId);
        if(messageResponse != null)
            return messageResponse;

        wordSearch = (wordSearch == null) ? "" : "%" + wordSearch + "%";
        List<Book> bookList = bookRepository.getAllByUserIdAndEnabledAndAuthorLikeOrTitleIsLike(userId, wordSearch, wordSearch, enabled);

        messageResponse = new MessageResponse();
        if(bookList.size() == 0)
            messageResponse.setCode(MessageResponseConstant.OK);
        else
            messageResponse.setCode(MessageResponseConstant.NO_CONTENT);
        messageResponse.setObject(bookList);

        return messageResponse;
    }

    @Override
    public MessageResponse getAllBooksByEnabled(HttpServletRequest request, boolean enabled){
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

        MessageResponse messageResponse;
        //Message message = new Message();

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        messageResponse = bookValidation.checkBookIsLocked(bookId);
        if(messageResponse != null)
            return messageResponse;

        Book book = bookRepository.findById(bookId).get();
        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        messageResponse.setObject(book);
        return messageResponse;
    }

    @Override
    public MessageResponse createBook(Book book, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;

        User userLogin = (User) request.getSession().getAttribute("userLogin");

        book.setCreatedAt(new Date());
        book.setUpdatedAt(new Date());
        book.setUserId(userLogin.getId());
        bookRepository.save(book);

        //message = new Message();
        //message.getContent().put("message", "create new book successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());

        return messageResponse;
    }

    @Override
    public MessageResponse updateBook(long bookId, Book book, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        // TODO: write function into bookValidationImpl to validate data receive

        Book bookIsSelected = bookRepository.findById(bookId).get();
        bookIsSelected.setUpdatedAt(new Date());
        bookIsSelected.setTitle(book.getTitle());
        bookIsSelected.setAuthor(book.getAuthor());
        bookIsSelected.setDescription(book.getDescription());
        bookRepository.save(bookIsSelected);

        //message = new Message();
        //message.getContent().put("message", "create new book successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());

        return messageResponse;
    }

    @Override
    public MessageResponse lockBook(long bookId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        Book bookIsSelected = bookRepository.findById(bookId).get();
        bookIsSelected.setEnabled(false);
        bookRepository.save(bookIsSelected);

        //message = new Message();
        //message.getContent().put("message", "Lock book successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());

        return messageResponse;
    }

    @Override
    public MessageResponse unlockBook(long bookId, HttpServletRequest request) {
        log(request);

        MessageResponse messageResponse;
        //Message message;

        messageResponse = bookValidation.checkBookIsExist(bookId);
        if(messageResponse != null)
            return messageResponse;

        Book bookIsSelected = bookRepository.findById(bookId).get();
        bookIsSelected.setEnabled(true);
        bookRepository.save(bookIsSelected);

        //message = new Message();
        //message.getContent().put("message", "Unlock book successfully");

        messageResponse = new MessageResponse();
        messageResponse.setCode(MessageResponseConstant.OK);
        //messageResponse.setObject(message.getContent());

        return messageResponse;
    }


}
