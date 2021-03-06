package com.ngoc.model;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class TeacherTest {
	@Test
	public void testDefaultConstructor() {
		Teacher teacher = new Teacher();
		teacher.setFullname("Than Quang Minh");
		teacher.setCountry("Quang Tri");
		teacher.setYearOfBirth(1985);
		teacher.setLevel(1);
		teacher.setAllowance(300);
		teacher.setMajor("IT");
		teacher.setNumberOfLessons(24);
		teacher.setCoefficientsSalary(3.5);
		
		assertEquals("Than Quang Minh", teacher.getFullname());
		assertEquals("Quang Tri", teacher.getCountry());
		assertEquals(1985, teacher.getYearOfBirth());
		assertEquals(1, teacher.getLevel());
		assertEquals(300, teacher.getAllowance(), 2);
		assertEquals("IT", teacher.getMajor());
		assertEquals(24, teacher.getNumberOfLessons());
		assertEquals(3.5, teacher.getCoefficientsSalary(), 2);
	}
	
	@Test
	public void testSetMajor() {
		Teacher teacher = new Teacher();
		teacher.setMajor("Math");
		
		assertEquals("Math", teacher.getMajor());
	}
	
	@Test
	public void testGetMajor() {
		Teacher teacher = new Teacher();
		teacher.setMajor("IBM");
		
		assertEquals("IBM", teacher.getMajor());
	}
	
	@Test
	public void testSetNumberOfLessons() {
		Teacher teacher = new Teacher();
		teacher.setNumberOfLessons(15);
		
		assertEquals(15, teacher.getNumberOfLessons());
	}
	
	@Test
	public void testGetNumberOfLessons() {
		Teacher teacher = new Teacher();
		teacher.setNumberOfLessons(25);
		
		assertEquals(25, teacher.getNumberOfLessons());
	}
	
	@Test
	public void testGetSalary() {
		Teacher teacher = new Teacher();
		teacher.setAllowance(2000);
		teacher.setCoefficientsSalary(5.0);
		teacher.setNumberOfLessons(25);
		
		assertEquals(6775, teacher.getSalary(), 2);
	}
}
