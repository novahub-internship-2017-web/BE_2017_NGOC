package com.ngoc.management.model;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

import com.ngoc.management.model.Employee;
import com.ngoc.management.model.Staff;
import com.ngoc.management.model.Teacher;

public class EmployeeHelper {

	public int showMainMenu() {
		Scanner input = new Scanner(System.in);

		int yourChoice = 0;

		System.out.println("-----------------------------");
		System.out.println("|         MAIN MENU         |");
		System.out.println("-----------------------------");
		System.out.println("1. Thêm mới cán bộ.");
		System.out.println("2. Chỉnh sửa thông tin cán bộ.");
		System.out.println("3. Xóa cán bộ.");
		System.out.println("4. Hiện thị danh sách cán bộ.");
		System.out.println("5. Thoát chương trình.");

		while (true) {

			System.out.print("Nhập lựa chọn (1->5): ");

			try {
				yourChoice = Integer.parseInt(input.nextLine());

				if (!(yourChoice >= 1 && yourChoice <= 5)) {
					System.out.println("Lựa chọn của bạn không tồn tại, mời nhập lại!");
				} else
					break;

			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn vừa nhận không hợp lệ, mời nhập lại!");
			}
		}

		return yourChoice;
	}

	
	public static final int ADD_NEW_EMPLOYEE_IN_END_OF_LIST = 1;
	public static final int ADD_NEW_EMPLOYEE_IN_BEGIN_OF_LIST = 2;
	public static final int ADD_NEW_EMPLOYEE_IN_K = 3;
	public static final int RETURN_MAIN_MENU_FROM_FIRST_MENU = 4;
	
	public void showMenuForFirstChoice(List<Employee> employeeList) {
		Scanner input = new Scanner(System.in);

		int yourChoice = 0;

		System.out.println("------------------------------------");
		System.out.println("1.1 Thêm cán bộ vào cuối danh sách.");
		System.out.println("1.2 Thêm cán bộ vào đầu danh sách.");
		System.out.println("1.3 Thêm cán bộ vào sau vị trí thứ k.");
		System.out.println("1.4 Quay lại mục trước.");

		while (true) {

			System.out.print("Nhập lựa chọn (1->4): ");

			try {
				yourChoice = Integer.parseInt(input.nextLine());

				if (!(yourChoice >= 1 && yourChoice <= 5)) {
					System.out.println("Lựa chọn của bạn không tồn tại, mời nhập lại!");
				} else
					break;

			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn vừa nhận không hợp lệ, mời nhập lại!");
			}
		}

		switch(yourChoice) {
		case ADD_NEW_EMPLOYEE_IN_END_OF_LIST:
			addNewEmploeeInEndOfList(employeeList, showMenuToChooseTypeOfEmployee());
			break;
		case ADD_NEW_EMPLOYEE_IN_BEGIN_OF_LIST:
			addNewEmploeeInBeginOfList(employeeList, showMenuToChooseTypeOfEmployee());
			break;
		case ADD_NEW_EMPLOYEE_IN_K:
			addNewEmploeeAtKindex(employeeList);
			break;
		case RETURN_MAIN_MENU_FROM_FIRST_MENU:
			return;
		
		default:
			break;
		}

		showMenuForFirstChoice(employeeList);
	}

	public int showMenuToChooseTypeOfEmployee() {
		int yourChoice = 0;

		Scanner input = new Scanner(System.in);

		System.out.println("Menu chọn loại cán bộ");
		System.out.println("1. Giảng viên");
		System.out.println("2. Nhân viên");

		while (true) {
			System.out.print("Nhập lựa chon (1->2): ");

			try {
				yourChoice = Integer.parseInt(input.nextLine());

				if (!(yourChoice >= 1 && yourChoice <= 2)) {
					System.out.println("Lựa chọn không tồn tại, mời nhập lại");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn không phù hơp, mời nhập lại!");
			}
		}

		return yourChoice;
	}

	public static final int TYPE_OF_TEACHER = 1;
	public static final int TYPE_OF_STAFF = 2;

	public void addNewEmploeeInEndOfList(List<Employee> employeeList, int typeOfEmployee) {

		switch (typeOfEmployee) {
		case TYPE_OF_TEACHER:
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeList.add(newTeacher);
			break;
		case TYPE_OF_STAFF:
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeList.add(newStaff);
			break;

		default:
			break;
		}
	}

	public void addNewEmploeeInBeginOfList(List<Employee> employeeList, int typeOfEmployee) {

		switch (typeOfEmployee) {
		case TYPE_OF_TEACHER:
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeList.add(0, newTeacher);
			break;

		case TYPE_OF_STAFF:
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeList.add(0, newStaff);
			break;

		default:
			break;
		}
	}

	public void addNewEmploeeAtKindex(List<Employee> employeeList) {
		Scanner input = new Scanner(System.in);

		int k;

		while (true) {
			System.out.print("Nhập vị trí thứ K: ");

			try {
				k = Integer.parseInt(input.nextLine());

				if (k < 0 || k > (employeeList.size())) {
					System.out.println("Xảy ra lỗi K thỏa điều kiện (0<= K <=" + (employeeList.size()) + "): ");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Vị trí K vừa nhập không hợp lệ, vui lòng nhập lại!");
			}
		}

		int typeOfEmployee = showMenuToChooseTypeOfEmployee();

		switch (typeOfEmployee) {
		case TYPE_OF_TEACHER: {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();

			if (!employeeList.isEmpty())
				employeeList.add(k + 1, newTeacher);
			else
				employeeList.add(newTeacher);
		}
			break;
		case TYPE_OF_STAFF: {
			Staff newStaff = new Staff();
			newStaff.inputData();

			if (!employeeList.isEmpty())
				employeeList.add(k + 1, newStaff);
			else
				employeeList.add(newStaff);
		}
			break;
		default:
			break;
		}
		
	}

	
	public void showMenuForSecondChoice(List<Employee> employeeList) {

		int index = -1;
		Scanner input = new Scanner(System.in);

		if (employeeList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return;
		}

		Employee employee;

		while (true) {
			System.out.print("Nhập thứ tự cán bộ cần chỉnh sửa (0->" + (employeeList.size() - 1) + "): ");

			try {
				index = Integer.parseInt(input.nextLine());

				if (!(index >= 0 && index <= (employeeList.size() - 1))) {
					System.out.println("Số thứ tự không tồn tại: ");
				} else {

					employee = employeeList.get(index);
					if (employee.getClass() == Staff.class) {
						((Staff) employee).editData();
						;
					} else {
						((Teacher) employee).editData();
					}

					break;
				}

			} catch (NumberFormatException numberException) {
				System.out.println("Số thứ tự không hợp lệ!");
			}
		}

	}

	
	public void showMenuForThirdChoice(List<Employee> employeeList) {
		int index = -1;
		Scanner input = new Scanner(System.in);

		if (employeeList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return;
		}

		while (true) {
			System.out.print("Nhập thứ tự cán bộ cần xóa (0->" + (employeeList.size() - 1) + "): ");

			try {
				index = Integer.parseInt(input.nextLine());

				if (!(index >= 0 && index <= (employeeList.size() - 1))) {
					System.out.println("Số thứ tự không tồn tại: ");
				} else {
					employeeList.remove(index);
					System.out.println("Xoá cán bộ thành công");
					break;
				}

			} catch (NumberFormatException numberException) {
				System.out.println("Số thứ tự không hợp lệ!");
			}
		}
	}

	
	public static final int SHOW_ALL_LIST_EMPLOYEE = 1;
	public static final int SHOW_LIST_EMPLOYEE_ORDERBY_SALARY = 2;
	public static final int SHOW_LIST_EMPLOYEE_ORDERBY_NAME = 3;
	public static final int FIND_EMPLOYEE_BY_NAME = 4;
	public static final int FIND_EMPLOYEE_BY_YEAR_OF_BIRTH = 5;
	public static final int RETURN_MAIN_MENU_FROM_FOURTH_MENU = 6;
	
	public void showMenuForFourthChoice(List<Employee> employeeList) {
		System.out.println("--------------------------------------------------");
		System.out.println("4.1 Hiện thị danh sách hiện tại.");
		System.out.println("4.2 Hiện thị danh sách sắp xếp tăng dần theo lương.");
		System.out.println("4.3 Hiện thị danh sách sắp xếp tên theo tên.");
		System.out.println("4.4 Tìm kiếm cán bộ theo tên.");
		System.out.println("4.5 Tìm kiếm cán bộ theo năm sinh.");
		System.out.println("4.6 Quay lại mục trước");

		int yourChoice = 0;
		Scanner input = new Scanner(System.in);

		while (true) {
			System.out.print("Nhập lựa chọn(1->6): ");

			try {
				yourChoice = Integer.parseInt(input.nextLine());

				if (!(yourChoice >= 1 && yourChoice <= 6)) {
					System.out.println("Lựa chọn không tồn tại, mời nhập lại!");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn không phù hợp, mời nhập lại!");
			}
		}

		switch (yourChoice) {
		case SHOW_ALL_LIST_EMPLOYEE:
			showAllEmployees(employeeList);
			break;

		case SHOW_LIST_EMPLOYEE_ORDERBY_SALARY:
			showAllEmployeesOrderBySalary(employeeList);
			break;

		case SHOW_LIST_EMPLOYEE_ORDERBY_NAME:
			showAllEmployeesOrderByName(employeeList);
			break;

		case FIND_EMPLOYEE_BY_NAME:
			showEmployeesByFindName(employeeList);
			break;

		case FIND_EMPLOYEE_BY_YEAR_OF_BIRTH:
			showEmployeesByFindYearOfBirth(employeeList);
			break;

		case RETURN_MAIN_MENU_FROM_FOURTH_MENU:
			return;

		default:
			break;
		}

		showMenuForFourthChoice(employeeList);

	}

	public void showAllEmployees(List<Employee> employeeList) {

		if (employeeList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return;
		}

		System.out.println(Employee.showHeader());
		int index = 0;
		for (Employee employee : employeeList) {

			if (employee.getClass() == Staff.class) {
				System.out.println(((Staff) employee).toString(index));
			}

			if (employee.getClass() == Teacher.class) {
				System.out.println(((Teacher) employee).toString(index));
			}

			index++;
		}
	}

	public void showAllEmployeesOrderBySalary(List<Employee> employeeList) {
		List<Employee> employeeListTemp = new ArrayList<>();

		for (Employee employee : employeeList) {
			employeeListTemp.add(employee);
		}

		Double employeeSalary;
		Double otherEmployeeSalary;

		for (int i = 0; i < employeeListTemp.size() - 1; i++) {
			for (int j = i + 1; j < employeeListTemp.size(); j++) {
				if (employeeListTemp.get(i).getClass() == Staff.class) {
					employeeSalary = ((Staff) employeeListTemp.get(i)).getSalary();
				} else {
					employeeSalary = ((Teacher) employeeListTemp.get(i)).getSalary();
				}

				if (employeeListTemp.get(j).getClass() == Staff.class) {
					otherEmployeeSalary = ((Staff) employeeListTemp.get(j)).getSalary();
				} else {
					otherEmployeeSalary = ((Teacher) employeeListTemp.get(j)).getSalary();
				}

				if (employeeSalary > otherEmployeeSalary) {
					Collections.swap(employeeListTemp, i, j);
				}

			}
		}

		showAllEmployees(employeeListTemp);

	}

	public void showAllEmployeesOrderByName(List<Employee> employeeList) {
		List<Employee> employeeListTemp = new ArrayList<>();

		for (Employee employee : employeeList) {
			employeeListTemp.add(employee);
		}

		String name = null;
		String otherName = null;

		for (int i = 0; i < employeeListTemp.size() - 1; i++) {
			for (int j = i + 1; j < employeeListTemp.size(); j++) {
				name = employeeListTemp.get(i).getFullname();
				otherName = employeeListTemp.get(j).getFullname();

				if (name.compareTo(otherName) > 0) {
					Collections.swap(employeeListTemp, i, j);
				}
			}
		}

		showAllEmployees(employeeListTemp);

	}

	public void showEmployeesByFindName(List<Employee> employeeList) {
		List<Employee> employeeListFinded = new ArrayList<>();

		Scanner input = new Scanner(System.in);
		String name = "";

		System.out.print("Nhập tên cần tìm kiếm: ");
		name = input.nextLine();

		int countEmployeesFinded = 0;
		String employeeName = "";

		for (Employee employee : employeeList) {
			employeeName = employee.getFullname();

			if (employeeName.toLowerCase().contains(name.toLowerCase())) {
				countEmployeesFinded++;
				employeeListFinded.add(employee);
			}
		}

		if (countEmployeesFinded == 0) {
			System.out.println("Không tìm thấy");
		} else {
			showAllEmployees(employeeListFinded);
		}

	}

	public void showEmployeesByFindYearOfBirth(List<Employee> employeeList) {
		List<Employee> employeeListFinded = new ArrayList<>();

		Scanner input = new Scanner(System.in);
		int yearOfBirth = 0;

		while (true) {
			System.out.print("Nhập năm sinh cần tìm kiếm: ");

			try {
				yearOfBirth = Integer.parseInt(input.nextLine());

				if (yearOfBirth < 1900) {
					System.out.println("Năm sinh phải >= 1900");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Năm sinh không hợp lệ");
			}

		}

		int countEmployeesFinded = 0;
		int employeeYearOfBirth = 0;

		for (Employee employee : employeeList) {
			employeeYearOfBirth = employee.getYearOfBirth();

			if (employeeYearOfBirth == yearOfBirth) {
				countEmployeesFinded++;
				employeeListFinded.add(employee);
			}
		}

		if (countEmployeesFinded == 0) {
			System.out.println("Không tìm thấy");
		} else {
			showAllEmployees(employeeListFinded);
		}

	}

}
