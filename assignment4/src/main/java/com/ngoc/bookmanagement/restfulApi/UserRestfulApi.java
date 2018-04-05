package com.ngoc.bookmanagement.restfulApi;

import com.ngoc.bookmanagement.model.User;
import com.ngoc.bookmanagement.repository.UserRepository;
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
public class UserRestfulApi {

    @Autowired
    private UserRepository userRepository;

    private static final Validator validator;

    static {
        Configuration<?> config = Validation.byDefaultProvider().configure();
        ValidatorFactory factory = config.buildValidatorFactory();
        validator = factory.getValidator();
        factory.close();
    }

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

        userRepository.save(oldUser);

        Message message = new Message();
        message.setMessage("Update successfully");

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{id}/lock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> lockUser(@PathVariable("id") long id){
        User userSelected = userRepository.findById(id).get();
        userSelected.setEnabled(true);

        Message message = new Message(("Lock user successfully"));

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    @PutMapping(value = "/api/user/{id}/unlock", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> unlockUser(@PathVariable("id") long id){
        User userSelected = userRepository.findById(id).get();
        userSelected.setEnabled(false);

        Message message = new Message(("Unlock user successfully"));

        return new ResponseEntity<Message>(message, HttpStatus.OK);
    }

    class Message{
        private String message;

        public String getMessage() {
            return message;
        }

        public void setMessage(String message) {
            this.message = message;
        }

        Message() {
        }

        Message(String message) {
            this.message = message;
        }
    }

}
