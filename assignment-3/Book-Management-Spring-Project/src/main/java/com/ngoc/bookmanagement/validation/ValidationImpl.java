package com.ngoc.bookmanagement.validation;

import org.springframework.stereotype.Component;

public class ValidationImpl implements Validation {

    public boolean comparePasswordAndMatchingPassword(String password, String matchingPassword) {
        return password.equals(matchingPassword);
    }
}
