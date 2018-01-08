package com.ngoc.management.model;

import java.util.Calendar;
import java.util.Scanner;

public abstract class Employee {
	protected String fullname;
	protected int yearOfBirth;
	protected String city;
	protected double coefficientsSalary;
	protected double allowance;
	protected int level;

	public Employee() {
		super();
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public int getYearOfBirth() {
		return yearOfBirth;
	}

	public void setYearOfBirth(int yearOfBirth) {
		this.yearOfBirth = yearOfBirth;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public double getCoefficientsSalary() {
		return coefficientsSalary;
	}

	public void setCoefficientsSalary(double coefficientsSalary) {
		this.coefficientsSalary = coefficientsSalary;
	}

	public double getAllowance() {
		return allowance;
	}

	public void setAllowance(double allowance) {
		this.allowance = allowance;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void inputFullName() {
		Scanner input = new Scanner(System.in);

		System.out.print("Họ tên : ");
		this.setFullname(input.nextLine());
	}

	public void inputCity() {
		Scanner input = new Scanner(System.in);

		System.out.print("Thành phố : ");
		this.setCity(input.nextLine());
	}

	public void inputYearOfBirth() {
		Scanner input = new Scanner(System.in);
		
		Calendar now = Calendar.getInstance();

		int yearLimit;
		yearLimit = now.get(Calendar.YEAR) - 15;

		while (true) {
			System.out.print("Năm sinh : ");

			try {
				yearOfBirth = Integer.parseInt(input.nextLine());

				if (yearOfBirth < 1900 || yearOfBirth > yearLimit) {
					System.out.println("Năm sinh phải >= 1900!, mời nhập lại");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Năm sinh vừa nhập không hợp lệ!, mời nhập lại");
			}
		}
	}

	public void inputCoefficientsSalary() {
		Scanner input = new Scanner(System.in);
		
		while (true) {
			System.out.print("Hệ số lương  : ");

			try {
				coefficientsSalary = Double.parseDouble(input.nextLine());

				if (coefficientsSalary < 0) {
					System.out.println("Hệ số lương vừa nhập không hợp lệ!, mời nhập lại");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Hệ số lương vừa nhập không hợp lệ!, mời nhập lại");
			}
		}
	}
	
	public void inputData() {
		
		inputFullName();
		inputCity();
		inputYearOfBirth();
		inputCoefficientsSalary();
		
	}

	public void editData() {

		System.out.println("Họ tên cũ : " + this.fullname);
		inputFullName();

		System.out.println("Thành phố cũ : " + this.city);
		inputCity();

		System.out.println("Năm sinh cũ : " + this.yearOfBirth);
		inputYearOfBirth();

		System.out.println("Hệ số lương : " + this.coefficientsSalary);
		inputCoefficientsSalary();
		
	}

	public static String showHeader() {
		String output;
		output = "--------------------------------------------------------------------------\n";
		output += "STT   Tên                  Năm sinh  Quê quán  Loại  C1    C2    C3    C4    C5";

		return output;
	}

	public abstract double getSalary();
}
