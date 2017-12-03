package action;

import java.util.ArrayList;

import com.ngoc.employee.Employee;

public class ActionDemo {

	public static void main(String[] args) {
		ArrayList<Employee> employeeArrayList = new ArrayList<Employee>();
		Action action = new Action();

		int yourChoice;
		boolean isExit = false;

		while (isExit == false) {
			yourChoice = action.showMainMenu();

			switch (yourChoice) {
			case 1:
				action.showMenuForFirstChoice(employeeArrayList);
				break;

			case 2:
				action.showMenuForSecondChoice(employeeArrayList);
				break;

			case 3:
				action.showMenuForThirdChoice(employeeArrayList);
				break;

			case 4:
				action.showMenuForFourthChoice(employeeArrayList);
				break;

			case 5:
				isExit = true;
				System.out.println("Thoát chương trình");
				break;

			default:
				break;
			}
		}
	}
}
