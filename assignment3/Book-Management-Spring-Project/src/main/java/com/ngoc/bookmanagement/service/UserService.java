package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface UserService {
    User getUserByEmail(String email);
    User getUserByEmailAndPassword(String email, String password);
    long save(User user) throws DuplicateEmailException;
    User get(long id);
    List<User> list();
    List<User> listWithUserRole();
    void update(long id, User user);
    void updateProfile(long id, User user);
    void updatePassword(long id, String password);
    void updateStatus(long id, Boolean status);
    void delete(long id);
    void writeSession(User user, HttpServletRequest request);
}
