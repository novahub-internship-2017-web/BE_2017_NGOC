package com.ngoc.model;

public class Staff extends Employee {
	private String department;
	private int daysOfWork;


	public Staff() {
		super();
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public int getDaysOfWork() {
		return daysOfWork;
	}

	public void setDaysOfWork(int daysOfWork) {
		this.daysOfWork = daysOfWork;
	}

	@Override
	public double getSalary() {
		double salary = 0;
		salary = this.coefficientsSalary * 730 + this.allowance + this.daysOfWork * 30;
		return salary;
	}
}
