package com.ngoc.bookmanagement.service;

import com.ngoc.bookmanagement.constant.Constant;
import com.ngoc.bookmanagement.exception.DuplicateEmailException;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.repository.UserRepositoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.NoResultException;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUserByEmail(String email){
        return userRepository.getUserByEmail(email);
    }

    @Override
    public User getUserByEmailAndPassword(String email, String password){
        return userRepository.getUserByEmailAndPassword(email, password);
    }

    @Override
    public long save(User user) throws DuplicateEmailException{
        return userRepository.save(user);
    }

    @Override
    public User get(long id) {
        return userRepository.get(id);
    }

    @Override
    public List<User> list() {
        return userRepository.list();
    }

    @Override
    public List<User> listWithUserRole() {
        return userRepository.listWithUserRole();
    }

    @Override
    public void update(long id, User user) {
        userRepository.update(id, user);
    }

    @Override
    public void updateProfile(long id, User user) {
        userRepository.updateProfile(id, user);
    }

    @Override
    public void updatePassword(long id, String password) {
        userRepository.updatePassword(id, password);
    }

    @Override
    public void updateStatus(long id, Boolean status){
        userRepository.updateStatus(id, status);
    }

    @Override
    public void delete(long id) {
        userRepository.delete(id);
    }

    @Override
    public void writeSession(User user, HttpServletRequest request) {
        request.getSession().setAttribute(Constant.userLoginSession, user);
    }
}
