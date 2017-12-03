package action;

import java.util.ArrayList;
import java.util.Collection;
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

	public void showMenuForFirstChoice(ArrayList<Employee> employeeArrayList) {
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

		switch (yourChoice) {
		case 1:
			addNewEmploeeInEndOfList(employeeArrayList, showMenuToChooseTypeOfEmployee());
			break;

		case 2:
			addNewEmploeeInBeginOfList(employeeArrayList, showMenuToChooseTypeOfEmployee());
			break;

		case 3:
			addNewEmploeeAtKindex(employeeArrayList, showMenuToChooseTypeOfEmployee());
			break;

		case 4: {
			return;
		}

		default:

			break;
		}

		showMenuForFirstChoice(employeeArrayList);
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

	public void addNewEmploeeInEndOfList(ArrayList<Employee> employeeArrayList, int typeOfEmployee) {
		switch (typeOfEmployee) {
		case 1: {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeArrayList.add(newTeacher);
		}
			break;
		case 2: {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeArrayList.add(newStaff);
		}
			break;
		default:
			break;
		}
	}

	public void addNewEmploeeInBeginOfList(ArrayList<Employee> employeeArrayList, int typeOfEmployee) {

		switch (typeOfEmployee) {
		case 1: {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeArrayList.add(0, newTeacher);
		}
			break;
		case 2: {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeArrayList.add(0, newStaff);
		}
			break;
		default:
			break;
		}
	}

	public void addNewEmploeeAtKindex(ArrayList<Employee> employeeArrayList, int typeOfEmployee) {
		Scanner input = new Scanner(System.in);

		int k;

		while (true) {
			System.out.print("Nhập vị trí thứ K: ");

			try {
				k = Integer.parseInt(input.nextLine());

				if (k < 0 || k >= (employeeArrayList.size() - 1)) {
					System.out.println("Xảy ra lỗi K thỏa điều kiện (0<= K <" + (employeeArrayList.size() - 1) + "): ");
				} else {
					break;
				}
			} catch (NumberFormatException numberException) {
				System.out.println("Vị trí K vừa nhập không hợp lệ, vui lòng nhập lại!");
			}
		}

		switch (typeOfEmployee) {
		case 1: {
			Teacher newTeacher = new Teacher();
			newTeacher.inputData();
			employeeArrayList.add(k + 1, newTeacher);
		}
			break;
		case 2: {
			Staff newStaff = new Staff();
			newStaff.inputData();
			employeeArrayList.add(k + 1, newStaff);
		}
			break;

		default:
			break;
		}
	}

	public void showMenuForSecondChoice(ArrayList<Employee> employeeArrayList) {

		int index = -1;
		Scanner input = new Scanner(System.in);

		if (employeeArrayList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return;
		}

		Employee employee;

		while (true) {
			System.out.print("Nhập thứ tự cán bộ cần chỉnh sửa (0->" + (employeeArrayList.size() - 1) + "): ");

			try {
				index = Integer.parseInt(input.nextLine());

				if (!(index >= 0 && index <= (employeeArrayList.size() - 1))) {
					System.out.println("Số thứ tự không tồn tại: ");
				} else {

					employee = employeeArrayList.get(index);
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

	public boolean showMenuForThirdChoice(ArrayList<Employee> employeeArrayList) {
		boolean output = false;
		int index = -1;
		Scanner input = new Scanner(System.in);

		if (employeeArrayList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return false;
		}

		while (true) {
			System.out.print("Nhập thứ tự cán bộ cần xóa (0->" + (employeeArrayList.size() - 1) + "): ");

			try {
				index = Integer.parseInt(input.nextLine());

				if (!(index >= 0 && index <= (employeeArrayList.size() - 1))) {
					System.out.println("Số thứ tự không tồn tại: ");
				} else {
					output = true;
				}

			} catch (NumberFormatException numberException) {
				System.out.println("Số thứ tự không hợp lệ!");
			}

			if (output == true) {
				employeeArrayList.remove(index);
				System.out.println("Xoá cán bộ thành công");
				break;
			}
		}

		return output;
	}

	public void showMenuForFourthChoice(ArrayList<Employee> employeeArrayList) {
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
			showAllEmployees(employeeArrayList);
			break;

		case 2:
			showAllEmployeesOrderBySalary(employeeArrayList);
			break;

		case 3:
			showAllEmployeesOrderByName(employeeArrayList);
			break;

		case 4:
			showEmployeesByFindName(employeeArrayList);
			break;

		case 5:
			showEmployeesByFindYearOfBirth(employeeArrayList);
			break;

		default:
			break;
		}

	}

	public void showAllEmployees(ArrayList<Employee> employeeArrayList) {
		System.out.println(Employee.showHeader());
		int index = 0;
		for (Employee employee : employeeArrayList) {

			if (employee.getClass() == Staff.class) {
				System.out.println(((Staff) employee).toString(index));
			}

			if (employee.getClass() == Teacher.class) {
				System.out.println(((Teacher) employee).toString(index));
			}

			index++;
		}
	}

	public void showAllEmployeesOrderBySalary(ArrayList<Employee> employeeArrayList) {
		ArrayList<Employee> employeeArrayListTemp = (ArrayList<Employee>) employeeArrayList.clone();

		Double employeeSalary, otherEmployeeSalary;
		employeeSalary = 0.0;
		otherEmployeeSalary = 0.0;

		for (int i = 0; i < employeeArrayListTemp.size() - 1; i++) {
			for (int j = i + 1; j < employeeArrayListTemp.size(); j++) {
				if (employeeArrayListTemp.get(i).getClass() == Staff.class) {
					employeeSalary = ((Staff) employeeArrayListTemp.get(i)).getSalary();
				} else {
					employeeSalary = ((Teacher) employeeArrayListTemp.get(i)).getSalary();
				}

				if (employeeArrayListTemp.get(j).getClass() == Staff.class) {
					otherEmployeeSalary = ((Staff) employeeArrayListTemp.get(j)).getSalary();
				} else {
					otherEmployeeSalary = ((Teacher) employeeArrayListTemp.get(j)).getSalary();
				}

				if (employeeSalary > otherEmployeeSalary) {
					Collections.swap(employeeArrayListTemp, i, j);
				}

			}
		}

		showAllEmployees(employeeArrayListTemp);

	}

	public void showAllEmployeesOrderByName(ArrayList<Employee> employeeArrayList) {
		ArrayList<Employee> employeeArrayListTemp = (ArrayList<Employee>) employeeArrayList.clone();

		String name = null;
		String otherName = null;

		for (int i = 0; i < employeeArrayListTemp.size() - 1; i++) {
			for (int j = i + 1; j < employeeArrayListTemp.size(); j++) {
				name = employeeArrayListTemp.get(i).getFullname();
				otherName = employeeArrayListTemp.get(j).getFullname();

				if (name.compareTo(otherName) == 1) {
					Collections.swap(employeeArrayListTemp, i, j);
				}
			}
		}

		showAllEmployees(employeeArrayListTemp);

	}

	public void showEmployeesByFindName(ArrayList<Employee> employeeArrayList) {
		ArrayList<Employee> employeeArrayListFinded = new ArrayList<>();

		Scanner input = new Scanner(System.in);
		String name = "";

		System.out.print("Nhập tên cần tìm kiếm: ");
		name = input.nextLine();

		int countEmployeesFinded = 0;
		String employeeName = "";

		for (Employee employee : employeeArrayList) {
			employeeName = employee.getFullname();

			if (employeeName.toLowerCase().contains(name.toLowerCase())) {
				countEmployeesFinded++;
				employeeArrayListFinded.add(employee);
			}
		}

		if (countEmployeesFinded == 0) {
			System.out.println("Không tìm thấy");
		} else {
			showAllEmployees(employeeArrayListFinded);
		}

	}

	public void showEmployeesByFindYearOfBirth(ArrayList<Employee> employeeArrayList) {
		ArrayList<Employee> employeeArrayListFinded = new ArrayList<>();

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

		for (Employee employee : employeeArrayList) {
			employeeYearOfBirth = employee.getYearOfBirth();

			if (employeeYearOfBirth == yearOfBirth) {
				countEmployeesFinded++;
				employeeArrayListFinded.add(employee);
			}
		}

		if (countEmployeesFinded == 0) {
			System.out.println("Không tìm thấy");
		} else {
			showAllEmployees(employeeArrayListFinded);
		}

	}

}
