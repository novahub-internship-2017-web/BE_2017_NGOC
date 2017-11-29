package staff;

import employee.Employee;

public class Staff extends Employee{
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
  
}
