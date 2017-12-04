package com.ngoc.action;

import java.util.List;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Scanner;

import com.ngoc.employee.Employee;
import com.ngoc.staff.Staff;
import com.ngoc.teacher.Teacher;

public class Action {
	public int showMainMenu() {
		Scanner input = new Scanner(System.in);

		int yourChoice = 0;

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

	public void showMenuForFirstChoice(List<Employee> employeeList) {
		Scanner input = new Scanner(System.in);

		int yourChoice = 0;

		System.out.println("------------------------------------");
		System.out.println("1. Thêm cán bộ vào cuối danh sách.");
		System.out.println("2. Thêm cán bộ vào đầu danh sách.");
		System.out.println("3. Thêm cán bộ vào sau vị trí thứ k.");
		System.out.println("4. Quay lại mục trước.");

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

		if (yourChoice == 1) {
			addNewEmploeeInEndOfList(employeeList, showMenuToChooseTypeOfEmployee());
		}

		if (yourChoice == 2) {
			addNewEmploeeInBeginOfList(employeeList, showMenuToChooseTypeOfEmployee());
		}

		if (yourChoice == 3) {
			addNewEmploeeAtKindex(employeeList, showMenuToChooseTypeOfEmployee());
		}

		if (yourChoice == 4) {
			return;
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

	public void addNewEmploeeInEndOfList(List<Employee> employeeList, int typeOfEmployee) {
		if (typeOfEmployee == 1) {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeList.add(newTeacher);
		} else if (typeOfEmployee == 2) {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeList.add(newStaff);
		}
	}

	public void addNewEmploeeInBeginOfList(List<Employee> employeeList, int typeOfEmployee) {

		if (typeOfEmployee == 1) {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeList.add(0, newTeacher);
		}

		if (typeOfEmployee == 2) {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeList.add(0, newStaff);
		}
	}

	public void addNewEmploeeAtKindex(List<Employee> employeeList, int typeOfEmployee) {
		Scanner input = new Scanner(System.in);

		int k;

		while (true) {
			System.out.print("Nhập vị trí thứ K: ");

			try {
				k = Integer.parseInt(input.nextLine());

				if (k < 0 || k >= (employeeList.size() - 1)) {
					System.out.println("Xảy ra lỗi K thỏa điều kiện (0<= K <" + (employeeList.size() - 1) + "): ");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Vị trí K vừa nhập không hợp lệ, vui lòng nhập lại!");
			}
		}

		if (typeOfEmployee == 1) {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeList.add(k + 1, newTeacher);
		}

		if (typeOfEmployee == 2) {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeList.add(k + 1, newStaff);
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
						((Staff) employee).inputData();
					} else {
						((Teacher) employee).inputData();
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

	public void showMenuForFourthChoice(List<Employee> employeeList) {
		System.out.println("--------------------------------------------------");
		System.out.println("1. Hiện thị danh sách hiện tại.");
		System.out.println("2. Hiện thị danh sách sắp xếp tăng dần theo lương.");
		System.out.println("3. Hiện thị danh sách sắp xếp tên theo tên.");
		System.out.println("4. Tìm kiếm cán bộ theo tên.");
		System.out.println("5. Tìm kiếm cán bộ theo năm sinh.");

		int yourChoice = 0;
		Scanner input = new Scanner(System.in);

		while (true) {
			System.out.print("Nhập lựa chọn(1->5): ");

			try {
				yourChoice = Integer.parseInt(input.nextLine());

				if (!(yourChoice >= 1 && yourChoice <= 5)) {
					System.out.println("Lựa chọn không tồn tại, mời nhập lại!");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Lựa chọn không phù hợp, mời nhập lại!");
			}
		}

		switch (yourChoice) {
		case 1:
			showAllEmployees(employeeList);
			break;

		case 2:
			showAllEmployeesOrderBySalary(employeeList);
			break;

		case 3:
			showAllEmployeesOrderByName(employeeList);
			break;

		case 4:
			showEmployeesByFindName(employeeList);
			break;

		case 5:
			showEmployeesByFindYearOfBirth(employeeList);
			break;

		default:
			break;
		}

	}

	public void showAllEmployees(List<Employee> employeeList) {
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
