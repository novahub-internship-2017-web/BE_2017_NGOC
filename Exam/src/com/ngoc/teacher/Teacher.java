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

	public String toString(int stt) {
		StringBuilder output = new StringBuilder();

		output.append(stt);
		for (int i = 0; i < (6 - String.valueOf(stt).length()); i++)
			output.append(" ");
			

		output.append(this.fullname);
		int lengthOfFullname = this.fullname.length();
		for (int i = 0; i < (21 - lengthOfFullname); i++)
			output.append(" ");

		output.append(this.yearOfBirth);
		int lengthOfYearOfBirth = String.valueOf(this.yearOfBirth).length();
		for (int i = 0; i < (10 - lengthOfYearOfBirth); i++)
			output.append(" ");

		output.append(this.city);
		int lengthOfCity = this.city.length();
		for (int i = 0; i < (10 - lengthOfCity); i++)
			output.append(" ");

		output.append("GV    ");

		output.append(this.major);
		int lengthOfMajor = this.major.length();
		for (int i = 0; i < (6 - lengthOfMajor); i++)
			output.append(" ");

		switch (this.level) {
		case TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL:
			output.append("TS    ");
			break;
		case TeacherHelper.MATER_LEVEL:
			output.append("PTS   ");
			break;
		case TeacherHelper.BACHELOR_LEVEL:
			output.append("CN    ");
			break;
		default:
			break;
		}

		output.append(this.allowance);
		int lengthOfAllowance = String.valueOf(this.allowance).length();
		for(int i = 0; i < (6 - lengthOfAllowance); i++)
			output.append(" ");
		
		output.append(this.numberOfLessons);
		int lengthOfNumberOfLessons = String.valueOf(this.numberOfLessons).length();
		for(int i = 0; i < (6 - lengthOfNumberOfLessons); i++)
			output.append(" ");
		
		output.append(this.coefficientsSalary);
		
		return output.toString();
	}
	
	@Override
	public void  inputData() {
		super.inputData();
  	
  	Scanner input = new Scanner(System.in);
  	
  	int yourLevelChoice = 0;
  	
  	// input level
  	System.out.println("Chọn trình độ: ");
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
			this.allowance = TeacherHelper.BACHELOR_ALLOWANCE;
			break;

		case TeacherHelper.MATER_LEVEL:
			this.allowance = TeacherHelper.MATER_ALLOWANCE;
			break;
			
		case TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL:
			this.allowance = TeacherHelper.DOCTOR_OF_PHILOSOPHY_ALLOWANCE;
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
  	
	}

}
