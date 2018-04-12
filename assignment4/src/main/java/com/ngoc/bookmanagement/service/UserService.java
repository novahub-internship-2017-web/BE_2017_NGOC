package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.model.MessageResponse;
import com.ngoc.bookmanagement.model.User;
import org.apache.catalina.servlet4preview.http.HttpServletRequest;

public interface UserService {

    MessageResponse getUser(String email, String password, HttpServletRequest request);

    MessageResponse getUserById(long userId, HttpServletRequest request);

    MessageResponse createUser(User user, HttpServletRequest request);

    MessageResponse updateUserById(long userId, User user, HttpServletRequest request);

    MessageResponse updateEnabledById(long userId, boolean enabled, HttpServletRequest request);
}
