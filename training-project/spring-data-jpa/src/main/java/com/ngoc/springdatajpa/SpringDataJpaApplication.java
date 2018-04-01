package com.ngoc.springdatajpa;

import com.ngoc.springdatajpa.dao.CustomerRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringDataJpaApplication {



    public static void main(String[] args) {
        SpringApplication.run(SpringDataJpaApplication.class, args);
    }


}
