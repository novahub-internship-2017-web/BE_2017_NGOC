package com.ngoc.management.model;

import java.util.Scanner;

import com.ngoc.management.model.Employee;

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

		output.append("NV    ");

		output.append(this.department);
		int lengthOfDepartment = this.department.length();
		for (int i = 0; i < (6 - lengthOfDepartment); i++)
			output.append(" ");

		switch (this.level) {
		case StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL:
			output.append("PP    ");
			break;
		case StaffHelper.HEAD_OF_DEPARTMENT_LEVEL:
			output.append("TP    ");
			break;
		case StaffHelper.STAFF_LEVEL:
			output.append("NV    ");
			break;
		default:
			break;
		}

		output.append(this.allowance);
		int lengthOfAllowance = String.valueOf(this.allowance).length();
		for (int i = 0; i < (6 - lengthOfAllowance); i++)
			output.append(" ");

		output.append(this.daysOfWork);
		int lengthOfDayOfWork = String.valueOf(this.daysOfWork).length();
		for (int i = 0; i < (6 - lengthOfDayOfWork); i++)
			output.append(" ");

		output.append(this.coefficientsSalary);

		return output.toString();
	}

	public void inputLevelAndAlowance() {
		Scanner input = new Scanner(System.in);

		int yourLevelChoice = 0;

		// input level
		System.out.println("Chọn chức vụ : ");
		System.out.println("1. Trưởng phòng");
		System.out.println("2. Phó phòng");
		System.out.println("3. Nhân viên");

		while (true) {
			System.out.print("Nhập lựa chọn (1->3): ");

			try {
				yourLevelChoice = Integer.parseInt(input.nextLine());

				if (!(yourLevelChoice >= 1 && yourLevelChoice <= 3)) {
					System.out.println("Lựa chọn của bạn không tồn tại, mời nhập lại!");
				} else {
					super.level = yourLevelChoice;

					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn của bạn không hợp lệ, mời nhập lại!");
			}
		}

		// set allowance depend on level
		switch (this.level) {
		case StaffHelper.HEAD_OF_DEPARTMENT_LEVEL:
			this.allowance = StaffHelper.HEAD_OF_DEPARTMENT_ALLOWANCE;
			break;

		case StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL:
			this.allowance = StaffHelper.DEPUTY_OF_DEPARTMENT_ALLOWANCE;
			break;

		case StaffHelper.STAFF_LEVEL:
			this.allowance = StaffHelper.STAFF_ALLOWANCE;
			break;

		default:
			break;
		}
	}

	public void inputDepartment() {
		Scanner input = new Scanner(System.in);

		System.out.print("Nhập phòng ban: ");
		this.department = input.nextLine();
	}

	public void inputDaysOfWork() {
		Scanner input = new Scanner(System.in);
		
		while (true) {
			System.out.print("Nhập số ngày công: ");

			try {
				this.daysOfWork = Integer.parseInt(input.nextLine());

				if (this.daysOfWork < 0) {
					System.out.println("Số ngày công không hợp lệ, mời nhập lại!");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Số ngày công không hợp lệ, mời nhập lại!");
			}
		}
	}
	
	@Override
	public void inputData() {
		super.inputData();

		inputLevelAndAlowance();
		inputDepartment();
		inputDaysOfWork();

	}

	@Override
	public void editData() {
		super.editData();

		System.out.print("Chức vụ cũ : ");
		switch (this.level) {
		case StaffHelper.HEAD_OF_DEPARTMENT_LEVEL:
			System.out.print(StaffHelper.HEAD_OF_DEPARTMENT_NAME);
			break;

		case StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL:
			System.out.print(StaffHelper.DEPUTY_OF_DEPARTMENT_NAME);
			break;

		case StaffHelper.STAFF_LEVEL:
			System.out.print(StaffHelper.STAFF_NAME);
			break;

		default:
			break;
		}

		inputLevelAndAlowance();

		System.out.println("Phòng ban cũ : " + this.department);
		inputDepartment();

		System.out.println("Số ngày công cũ : " + this.daysOfWork);
		inputDaysOfWork();
		
	}

}
