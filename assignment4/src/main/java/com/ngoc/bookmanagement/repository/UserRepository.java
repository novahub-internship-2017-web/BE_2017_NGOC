package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.User;
import org.springframework.data.repository.CrudRepository;

public interface UserRepository extends CrudRepository<User, Long> {
    boolean existsByEmail(String email);
    boolean existsByEmailAndPassword(String email, String password);
    User findByEmail(String email);
    User findByEmailAndPassword(String email, String password);
}