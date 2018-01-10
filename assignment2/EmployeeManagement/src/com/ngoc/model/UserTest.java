package com.ngoc.model;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class UserTest {
    @Test
    public void testConstructor(){
        User newUser = new User(1, "buingoc", "password", 2, true);

        assertEquals(1, newUser.getId());
        assertEquals("buingoc", newUser.getUsername());
        assertEquals("password", newUser.getPassword());
        assertEquals(2, newUser.getAccess());
    }

    public void testSetGetId(){
        User newUser = new User();
        newUser.setId(2);

        assertEquals(2, newUser.getId());
    }

    public void testSetGetUsername(){
        User newUser = new User();
        newUser.setUsername("username1");

        assertEquals("username1", newUser.getUsername());
    }

    public void testSetGetPassword(){
        User newUser = new User();
        newUser.setPassword("password");

        assertEquals("password", newUser.getPassword());
    }

    public void testSetGetAccess(){
        User newUser = new User();
        newUser.setAccess(3);

        assertEquals(3, newUser.getAccess());
    }

    public void testToString(){
        User newUser = new User();
        newUser.setId(1);
        newUser.setUsername("username");
        newUser.setPassword("password");
        newUser.setAccess(2);

        assertEquals("Username=username, Password=password, Access=2", newUser.toString());
    }
}
