package action;

import java.util.ArrayList;
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

				if (k < 0 | k >= (employeeArrayList.size() - 1)) {
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

	
	public int showMenuForSecondChoice(ArrayList<Employee> employeeArrayList) {

		int index = -1;
		Scanner input = new Scanner(System.in);

		if (employeeArrayList.isEmpty()) {
			System.out.println("Danh sách rỗng!");
			return -1;
		}

		while (true) {
			System.out.print("Nhập thứ tự cán bộ cần chỉnh sửa (0->" + (employeeArrayList.size() - 1) + "): ");

			try {
				index = Integer.parseInt(input.nextLine());

				if (!(index >= 0 && index <= (employeeArrayList.size() - 1))) {
					System.out.println("Số thứ tự không tồn tại: ");
				} else {
					break;
				}

			} catch (NumberFormatException numberException) {
				System.out.println("Số thứ tự không hợp lệ!");
			}
		}

		return index;
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
			
			if(output == true) {
				employeeArrayList.remove(index);
				System.out.println("Xoá cán bộ thành công");				
				break;
			}
		}

		return output;
	}

	public int showMenuForFourthChoice() {
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

		return yourChoice;
	}

}
