package com.ngoc.model;

public class Teacher extends Employee {
	private String major;
	private int numberOfLessons;

	public Teacher() {
		super();
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public int getNumberOfLessons() {
		return numberOfLessons;
	}

	public void setNumberOfLessons(int numberOfLessons) {
		this.numberOfLessons = numberOfLessons;
	}

	@Override
	public double getSalary() {
		double salary = 0;
		salary = super.coefficientsSalary * 730 + super.allowance + this.numberOfLessons * 45;
		return salary;
	}
}
