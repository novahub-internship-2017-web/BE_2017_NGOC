package action;

import java.util.ArrayList;
import java.util.List;

import com.ngoc.employee.Employee;

public class ActionDemo {

	public static void main(String[] args) {
		List<Employee> employeeArrayList = new ArrayList<>();
		Action action = new Action();

		int yourChoice;
		boolean isNotExit = true;

		while (isNotExit) {
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
				isNotExit = false;
				System.out.println("Thoát chương trình");
				break;

			default:
				break;
			}
		}
	}
}
