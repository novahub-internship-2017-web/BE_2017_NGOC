package com.ngoc.model;

import java.io.Serializable;

public class User implements Serializable {

    private static final long serialVersionUID = 430L;
    public static final int ADMIN_ACCESS = 0;
    public static final String ADMIN_NAME = "Admin";
    public static final int STAFF_ACCESS = 1;
    public static final String STAFF_NAME = "Staff";
    public static final int TEACHER_ACCESS = 2;
    public static final String TEACHER_NAME = "Teacher";

    private int id;
    private String username;
    private String password;
    private int access;
    private boolean active;

    public User(){
        super();
    }

    public User(int id, String username, String password, int access, boolean active){
        this.id = id;
        this.username = username;
        this.password = password;
        this.access = access;
        this.active = active;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getAccess() {
        return this.access;
    }

    public void setAccess(int access) {
        this.access = access;
    }

    public boolean getActive() {
        return active;
    }

    public void setActive(boolean active) {
        this.active = active;
    }

    @Override
    public String toString() {
        return "Username=" + username + ", Password=" + password + ", Access=" + access;
    }
}
