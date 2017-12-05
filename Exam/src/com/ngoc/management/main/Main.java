package com.ngoc.management.main;

import java.util.ArrayList;
import java.util.List;

import com.ngoc.management.model.Employee;
import com.ngoc.management.model.EmployeeHelper;

public class Main {

	public static final int SHOW_FIRST_CHOICE_MENU = 1;
	public static final int SHOW_SECOND_CHOICE_MENU = 2;
	public static final int SHOW_THIRD_CHOICE_MENU = 3;
	public static final int SHOW_FOURTH_CHOICE_MENU = 4;
	public static final int EXIT_PROGRAM = 5;
	
	public static void main(String[] args) {
		List<Employee> employeeArrayList = new ArrayList<>();
		EmployeeHelper employeeHelper = new EmployeeHelper();
		

		int yourChoice;
		boolean isNotExit = true;

		while (isNotExit) {
			yourChoice = employeeHelper.showMainMenu();

			switch (yourChoice) {
			case SHOW_FIRST_CHOICE_MENU:
				employeeHelper.showMenuForFirstChoice(employeeArrayList);
				break;

			case SHOW_SECOND_CHOICE_MENU:
				employeeHelper.showMenuForSecondChoice(employeeArrayList);
				break;

			case SHOW_THIRD_CHOICE_MENU:
				employeeHelper.showMenuForThirdChoice(employeeArrayList);
				break;

			case SHOW_FOURTH_CHOICE_MENU:
				employeeHelper.showMenuForFourthChoice(employeeArrayList);
				break;

			case EXIT_PROGRAM:
				isNotExit = false;
				System.out.println("Thoát chương trình");
				break;

			default:
				break;
			}
		}
	}
}
