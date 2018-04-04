package com.ngoc.bookmanagement.service;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;

@Service
public class PasswordEncryptionImpl implements PasswordEncryption{

    @Override
    public String encryptPassword(String passwordParam) {
        return DigestUtils.sha256Hex(passwordParam);
    }
}
