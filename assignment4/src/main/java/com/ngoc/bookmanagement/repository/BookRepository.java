package com.ngoc.bookmanagement.repository;

import com.ngoc.bookmanagement.model.Book;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface BookRepository extends CrudRepository<Book, Long> {
    List<Book> getAllByEnabled(boolean enabled);

    List<Book> getAllByUserId(long userId);

    @Query("FROM Book book WHERE book.userId = :userId AND (book.author LIKE :author OR book.title LIKE :title)")
    List<Book> getAllByUserIdAndAuthorLikeOrTitleLike(@Param("userId") long userId,
                                                      @Param("author") String author,
                                                      @Param("title") String title);

    @Query("FROM Book book WHERE book.userId = :userId AND book.enabled = :enabled AND (book.author LIKE :author OR book.title LIKE :title)")
    List<Book> getAllByUserIdAndEnabledAndAuthorLikeOrTitleIsLike(@Param("userId") long userId,
                                                                  @Param("author") String author,
                                                                  @Param("title") String title,
                                                                  @Param("enabled") boolean enabled);

    @Query("FROM Book book WHERE book.enabled = true OR book.userId = :userId")
    List<Book> getAllByEnabledTrueAndUserIdAndEnabledDisable(@Param("userId") long userId);

    List<Book> getAllByUserIdAndEnabled(long userId, boolean enabled);

    List<Book> getAllByAuthorLikeOrTitleLike(String author, String title);
}
