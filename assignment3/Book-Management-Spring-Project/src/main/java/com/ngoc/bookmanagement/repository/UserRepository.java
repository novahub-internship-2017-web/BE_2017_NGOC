package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.User;

import java.util.List;

public interface UserRepository {

    User getUserByEmail(String email);

    User getUserByEmailAndPassword(String email, String password);

    User get(long id);

    List<User> list();

    List<User> listWithUserRole();

    void update(long id, User user);

    void updateProfile(long id, User user);

    void updatePassword(long id, String password);

    void updateStatus(long id, Boolean status);

    long save(User user) throws DuplicateEmailException;

    void delete(long id);
}
