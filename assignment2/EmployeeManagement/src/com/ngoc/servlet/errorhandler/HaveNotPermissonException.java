package com.ngoc.servlet.errorhandler;

import javax.servlet.ServletException;

public class HaveNotPermissonException extends ServletException {
    public HaveNotPermissonException(){
        super("403");
    }
}
