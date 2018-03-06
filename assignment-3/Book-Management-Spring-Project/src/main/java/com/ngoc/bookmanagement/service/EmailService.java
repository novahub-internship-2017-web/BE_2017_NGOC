package com.ngoc.bookmanagement.service;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

public interface EmailService {
    void sendMessage(String emailRecevie, String subject, String body) throws AddressException, MessagingException;
}
