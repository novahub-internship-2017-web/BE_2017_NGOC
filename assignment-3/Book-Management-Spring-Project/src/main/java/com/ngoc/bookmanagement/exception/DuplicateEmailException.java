package com.ngoc.bookmanagement.exception;

public class DuplicateEmailException extends Exception{
    public DuplicateEmailException(String message){
        super(message);
    }
}
