package com.ngoc.bookmanagement.model;

import org.junit.Before;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserTest {

    User user;

    @Before
    public void setUp() throws Exception {
        user = new User();
        user.setId(1);
        user.setEmail("admin@gmail.com");
        user.setPassword("password");
        user.setFirstName("Bùi Lâm");
        user.setLastName("Quang Ngọc");
        user.setStatus(true);
    }

    @Test
    public void getId() {
        assertEquals(1, user.getId());
    }

    @Test
    public void setId() {
        user.setId(2);
        assertEquals(2, user.getId());
    }

    @Test
    public void getEmail() {
        assertEquals("admin@gmail.com", user.getEmail());
    }

    @Test
    public void setEmail() {
        user.setEmail("builamquangngoc91@gmail.com");
        assertEquals("builamquangngoc91@gmail.com", user.getEmail());
    }

    @Test
    public void getPassword() {
        assertEquals("password", user.getPassword());
    }

    @Test
    public void setPassword() {
        user.setPassword("newpassword");
        assertEquals("newpassword", user.getPassword());
    }

    @Test
    public void getFirstName() {
        assertEquals("Bùi Lâm", user.getFirstName());
    }

    @Test
    public void setFirstName() {
        user.setFirstName("First name");
        assertEquals("First name", user.getFirstName());
    }

    @Test
    public void getLastName() {
        assertEquals("Quang Ngọc", user.getLastName());
    }

    @Test
    public void setLastName() {
        user.setLastName("Last name");
        assertEquals("Last name", user.getLastName());
    }

    @Test
    public void getStatus() {
        assertEquals(true, user.getStatus());
    }

    @Test
    public void setStatus() {
        user.setStatus(false);
        assertEquals(false, user.getStatus());
    }

    @Test
    public void testToString(){
        assertEquals("User{id=1, email='admin@gmail.com', password='password', firstName='Bùi Lâm', lastName='Quang Ngọc', status=true}", user.toString());
    }

}