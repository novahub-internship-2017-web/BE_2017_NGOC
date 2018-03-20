package com.ngoc.bookmanagement.controller;

import org.apache.log4j.Logger;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class UploadRestController {

    private final Logger logger = Logger.getLogger(UploadRestController.class);

    @PostMapping("/uploadFile")
    public ResponseEntity<?> uploadFilePost(
            @RequestParam("extraField") String extraField,
            @RequestParam("files") MultipartFile uploadFile){
        logger.debug("Single file upload!");

        if(uploadFile.isEmpty()){
            logger.debug("please select a file!");
            return new ResponseEntity("please select a file!", HttpStatus.OK);
        }else{
            logger.debug("Successfull uploaded - " + uploadFile.getOriginalFilename());
            return new ResponseEntity("Successfull uploaded - " + uploadFile.getOriginalFilename(), new HttpHeaders(), HttpStatus.OK);
        }
    }
}
