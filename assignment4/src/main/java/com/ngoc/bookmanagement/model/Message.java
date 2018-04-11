package com.ngoc.bookmanagement.model;

import java.io.Serializable;
import java.util.HashMap;

public class Message implements Serializable {
    HashMap<String, Object> content;

    public Message() {
        content = new HashMap<String, Object>();
    }

    public HashMap<String, Object> getContent() {
        return content;
    }

    public void setContent(HashMap<String, Object> content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "Message{" +
                "content=" + content +
                '}';
    }
}
