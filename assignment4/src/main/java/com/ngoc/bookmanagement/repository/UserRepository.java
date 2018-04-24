package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends PagingAndSortingRepository<User, Long> {

    boolean existsByEmail(String email);

    boolean existsByEmailAndPassword(String email, String password);

    @Query("SELECT user " +
            "FROM User user " +
            "JOIN Role role ON user.roleId = role.id " +
            "WHERE role.name = :roleName AND (user.firstName LIKE :firstName OR user.lastName LIKE :lastName OR user.email LIKE :email)")
    Page<User> findAllByRoleAndFirstNameOrLastNameOrEmail(@Param("roleName") String roleName,
                                                          @Param("firstName") String firstName,
                                                          @Param("lastName") String lastName,
                                                          @Param("email") String email,
                                                          Pageable pageable);

    User findByEmail(String email);


    User findByEmailAndPassword(String email, String password);

}
