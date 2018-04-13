package com.ngoc.bookmanagement.model;

import com.fasterxml.jackson.annotation.JsonInclude;

import java.io.Serializable;

public class MessageResponse implements Serializable {

    private int code;

    @JsonInclude(JsonInclude.Include.NON_NULL)
    private Object object;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
    }

    public MessageResponse() {
    }

    public MessageResponse(int code) {
        this.code = code;
    }

    public MessageResponse(int code, Object object) {
        this.code = code;
        this.object = object;
    }
    
    @Override
    public String toString() {
        return "MessageResponse{" +
                "code=" + code +
                ", object=" + object +
                '}';
    }
}
