package com.ngoc.bookmanagement.service;

import org.springframework.stereotype.Service;

@Service
public class PasswordServiceImpl implements PasswordService{
    // encrypt password using sha512Hex

    @Override
    public String encryptPassword(String password) {
        return org.apache.commons.codec.digest.DigestUtils.sha512Hex(password);
    }
}
