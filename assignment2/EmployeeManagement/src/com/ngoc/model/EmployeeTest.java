package com.ngoc.model;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

public class EmployeeTest {
	Employee employee = new Employee() {
		
		@Override
		public double getSalary() {
			return 0;
		}
	};
	
	@Test
	public void testDefaultConstructor() {
		Employee newEmployee = new Employee() {
			
			@Override
			public double getSalary() {
				return 0;
			}
		};
		
		newEmployee.setFullname("Bui Lam Quang Ngoc");
		newEmployee.setCountry("Viet Nam");
		newEmployee.setAllowance(3000);
		newEmployee.setLevel(2);
		newEmployee.setYearOfBirth(1997);
		newEmployee.setCoefficientsSalary(4);
		
		assertEquals("Bui Lam Quang Ngoc", newEmployee.getFullname());
		assertEquals("Da Nang", newEmployee.getCountry());
		assertEquals(3000, newEmployee.getAllowance(), 2);
		assertEquals(2, newEmployee.getLevel());
		assertEquals(1997, newEmployee.getYearOfBirth());
		assertEquals(4, newEmployee.getCoefficientsSalary(), 2);
	}
	
	@Test
	public void testSetFullname() {
		employee.setFullname("Dieu Ny");
		
		assertEquals("Dieu Ny", employee.getFullname());
	}
	
	@Test
	public void testGetFullname() {
		employee.setFullname("Thanh Hai");
		
		assertEquals("Thanh Hai", employee.getFullname());
	}
	
	@Test
	public void testSetYearOfBirth() {
		employee.setYearOfBirth(1997);
		
		assertEquals(1997, employee.getYearOfBirth());
	}
	
	@Test
	public void testSetCity() {
		employee.setCountry("Viet Nam");
		
		assertEquals("Da Nang", employee.getCountry());
	}
	
	@Test
	public void testGetCity() {
		employee.setCountry("Viet Nam");
		
		assertEquals("Quang Nam", employee.getCountry());
	}
	
	@Test
	public void testSetCoefficientsSalary() {
		employee.setCoefficientsSalary(4.7);
		
		assertEquals(4.7, employee.getCoefficientsSalary(), 2);
	}
	
	@Test
	public void testGetCoefficientsSalary() {
		employee.setCoefficientsSalary(2.5);
		
		assertEquals(2.5, employee.getCoefficientsSalary(), 2);
	}
	
	@Test
	public void testSetAllowance() {
		employee.setAllowance(1000);
		
		assertEquals(1000, employee.getAllowance(), 2);
	}
	
	@Test
	public void testGetAllowance() {
		employee.setAllowance(1500);
		
		assertEquals(1500, employee.getAllowance(), 2);
	}
	
	@Test
	public void testSetLevel() {
		employee.setLevel(1);
		
		assertEquals(1, employee.getLevel());
	}
	
	@Test
	public void testGetLevel() {
		employee.setLevel(2);
		
		assertEquals(2, employee.getLevel());
	}
	
}
