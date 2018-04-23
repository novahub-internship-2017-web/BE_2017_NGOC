package com.ngoc.bookmanagement;

import com.ngoc.bookmanagement.model.Book;
import com.ngoc.bookmanagement.model.Comment;
import com.ngoc.bookmanagement.model.User;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.rest.core.config.RepositoryRestConfiguration;
import org.springframework.data.rest.webmvc.config.RepositoryRestConfigurerAdapter;

@Configuration
public class RepositoryConfig extends RepositoryRestConfigurerAdapter {
    @Override
    public void configureRepositoryRestConfiguration(RepositoryRestConfiguration config) {
        config.exposeIdsFor(Book.class);
        config.exposeIdsFor(Comment.class);
        config.exposeIdsFor(User.class);
    }
}