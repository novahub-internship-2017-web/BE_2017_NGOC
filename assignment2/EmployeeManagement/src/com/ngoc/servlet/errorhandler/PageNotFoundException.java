package com.ngoc.servlet.errorhandler;

import javax.servlet.ServletException;

public class PageNotFoundException extends ServletException {
    public PageNotFoundException(){
        super("404");
    }
}
