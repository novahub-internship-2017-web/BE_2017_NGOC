package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.model.Message;
import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
import com.ngoc.bookmanagement.service.PasswordEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Configuration;
import javax.validation.Validation;
import javax.validation.Validator;
import javax.validation.ValidatorFactory;

@RestController
public class UserRestfulAPI {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private PasswordEncryption passwordEncryption;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

    // API get an User
    @GetMapping(value = "/api/user/{id}", produces = { MediaType.APPLICATION_JSON_VALUE })
    public ResponseEntity<?> getUser(@PathVariable("id") long id){

        User user = userRepository.findById(id).get();
        return new ResponseEntity<User>(user, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{id}", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> updateUserProfile(@PathVariable("id") long id, @RequestBody User userParam){
        User oldUser = userRepository.findById(id).get();
        oldUser.setFirstName(userParam.getFirstName());
        oldUser.setLastName(userParam.getLastName());

        if(userParam.getPassword() != null)
            oldUser.setPassword(passwordEncryption.encryptPassword(userParam.getPassword()));

        userRepository.save(oldUser);

        Message message = new Message();
        message.getContent().put("message", "Update successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{id}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockUser(@PathVariable("id") long id){
        User userSelected = userRepository.findById(id).get();
        userSelected.setEnabled(false);

        userRepository.save(userSelected);

        Message message = new Message();
        message.getContent().put("message", "Lock user successfully");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{id}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockUser(@PathVariable("id") long id){
        User userSelected = userRepository.findById(id).get();
        userSelected.setEnabled(true);
        userRepository.save(userSelected);

        Message message = new Message();
        message.getContent().put("message", "Unlock user successfully");

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

}
