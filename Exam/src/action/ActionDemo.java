package action;

import java.nio.channels.ShutdownChannelGroupException;
import java.util.ArrayList;

import com.ngoc.employee.Employee;

public class ActionDemo {

	public static void main(String[] args) {
		ArrayList<Employee> employeeArrayList = new ArrayList<Employee>();
		Action action = new Action();

		int yourChoice;
		
		while (true) {
			yourChoice = action.showMainMenu();
			
			switch (yourChoice) {
			case 1:
					action.showMenuForFirstChoice(employeeArrayList);
				break;
					
			case 2:
				break;
				
			case 3:
					action.showMenuForThirdChoice(employeeArrayList);
				break;
			case 4:
				break;
				
			default:
				break;
			}
			
			if(yourChoice == 5)
				break;
		}
	}
}
