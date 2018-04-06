package com.ngoc.bookmanagement.restfulAPI;

import com.ngoc.bookmanagement.model.Message;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


@RestController
public class TestRestfulAPI {

    @GetMapping(value = "/api/test", produces = {MediaType.APPLICATION_JSON_VALUE})
    public ResponseEntity<?> testGet(){
        Message message = new Message();
        message.getContent().put("message1", "mi ngu qua");
        message.getContent().put("message2", "mi khon hon ai");

        return new ResponseEntity<>(message.getContent(), HttpStatus.OK);
    }
}
