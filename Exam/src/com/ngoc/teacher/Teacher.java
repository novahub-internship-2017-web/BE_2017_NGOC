package com.ngoc.teacher;

import java.util.Scanner;

import com.ngoc.employee.Employee;

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

	@Override
	public void  inputData() {
		super.inputData();
  	
  	Scanner input = new Scanner(System.in);
  	
  	int yourLevelChoice = 0;
  	
  	// input level
  	System.out.println("Chọn trình độS: ");
  	System.out.println("1. Cử nhân");
  	System.out.println("2. Thạc sĩ");
  	System.out.println("3. Tiến sĩ");
  	
  	while(true) {
  		System.out.print("Nhập lựa chọn (1->3): ");
  		
  		try {
  			yourLevelChoice = Integer.parseInt(input.nextLine());
  			
  			if(!(yourLevelChoice >= 1 && yourLevelChoice <= 3)) {
  				System.out.println("Lựa chọn của bạn không tồn tại, mời nhập lại!");
  			}
  			else {
  				super.level = yourLevelChoice;			
  				
  				break;
  			}
  		}
  		catch(NumberFormatException numberException) {
  			System.out.println("Lựa chọn của bạn không hợp lệ, mời nhập lại!");
  		}
  	}
  	
  	// set allowance depend on level
  	switch (this.level) {
		case TeacherHelper.BACHELOR_LEVEL:
			this.allowance = 300;
			break;

		case TeacherHelper.MATER_LEVEL:
			this.allowance = 900;
			break;
			
		case TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL:
			this.allowance = 2000;
			break;
			
		default:
			break;
		}
  	
  	// input major (khoa)
  	System.out.print("Nhập khoa: ");
  	this.major = input.nextLine();	
  	
  	while(true) {
  		System.out.print("Nhập số tiết dạy trong tháng: ");
  		
  		try {
  			this.numberOfLessons = Integer.parseInt(input.nextLine());
  			
  			if(this.numberOfLessons < 0) {
  				System.out.println("Số ngày công không hợp lệ, mời nhập lại!");
  			}
  			else {
  				break;
  			}
  		}
  		catch(NumberFormatException numberException) {
  			System.out.println("Số ngày công không hợp lệ, mời nhập lại!");
  		}
  	}
  	
  	input.close();
	}

}
