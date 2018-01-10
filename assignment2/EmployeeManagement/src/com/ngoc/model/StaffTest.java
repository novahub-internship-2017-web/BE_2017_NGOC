package com.ngoc.model;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class StaffTest {

	@Test
	public void testDefaultConstructor() {
		Staff staff = new Staff();
		staff.setFullname("Bui Lam Quang Ngoc");
		staff.setCountry("Da Nang");
		staff.setYearOfBirth(1994);
		staff.setCoefficientsSalary(2.4);
		staff.setDaysOfWork(27);
		staff.setDepartment("IT");
		staff.setAllowance(900);
		staff.setLevel(1);
		
		assertEquals("Bui Lam Quang Ngoc", staff.getFullname());
		assertEquals("Da Nang", staff.getCountry());
		assertEquals(1994, staff.getYearOfBirth());
		assertEquals(2.4, staff.getCoefficientsSalary(), 2);
		assertEquals(27, staff.getDaysOfWork());
		assertEquals("IT", staff.getDepartment());
		assertEquals(900, staff.getAllowance(), 2);
		assertEquals(1, staff.getLevel());
	}
	
	@Test
	public void testSetDaysOfWork() {
		Staff staff = new Staff();
		staff.setDaysOfWork(25);
		
		assertEquals(25, staff.getDaysOfWork());
	}
	
	@Test
	public void testGetDaysOfWork() {
		Staff staff = new Staff();
		staff.setDaysOfWork(27);
		
		assertEquals(27, staff.getDaysOfWork());
	}
	
	@Test
	public void testSetDepartment() {
		Staff staff = new Staff();
		staff.setDepartment("IT");
		
		assertEquals("IT", staff.getDepartment());
	}
	
	@Test
	public void testGetDepartment() {
		Staff staff = new Staff();
		staff.setDepartment("Service");
	
		assertEquals("Service", staff.getDepartment());
	}
	
	@Test
	public void testGetSalary() {
		Staff staff = new Staff();
		staff.setAllowance(900);
		staff.setCoefficientsSalary(5.0);
		staff.setDaysOfWork(25);
		
		assertEquals(5300, staff.getSalary(), 2);
	}
}
