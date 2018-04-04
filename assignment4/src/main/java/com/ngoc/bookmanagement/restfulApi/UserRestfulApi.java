package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class UserRestfulApi {

    @Autowired
    private UserRepository userRepository;

    @GetMapping(value = "/api/user/{id}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> userGet(@PathVariable("id") long id){
        User user = userRepository.findById(id).get();
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    @PutMapping(value = "/apt/user/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> userPut(@PathVariable("id") long id){

        return null;
    }

}
