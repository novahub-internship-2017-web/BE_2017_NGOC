package employee;

import java.util.Scanner;

public class Employee {
  protected String fullname;
  protected int yearOfBirth;
  protected String city;
  protected int coefficientsSalary;
  protected int allowance;
  
  public Employee() {
    super();
  }

  public String getFullname() {
    return fullname;
  }
	
  public void setFullname(String fullname) {
    this.fullname = fullname;
  }

  public int getYearOfBirth() {
    return yearOfBirth;
  }
	
  public void setYearOfBirth(int yearOfBirth) {
    this.yearOfBirth = yearOfBirth;
  }
	
  public String getCity() {
    return city;
  }
	
  public void setCity(String city) {
    this.city = city;
  }
	
  public int getCoefficientsSalary() {
    return coefficientsSalary;
  }
	
  public void setCoefficientsSalary(int coefficientsSalary) {
    this.coefficientsSalary = coefficientsSalary;
  }
	
  public int getAllowance() {
    return allowance;
  }
	
  public void setAllowance(int allowance) {
    this.allowance = allowance;
  }
  
  public Employee inputData() {
    Employee employee = new Employee();
    
    Scanner input = new Scanner(System.in);
    
    System.out.print("Họ tên : ");
    employee.setFullname(input.nextLine());
    
    while(true) {
      try {
        System.out.print("Năm sinh : ");
        employee.setYearOfBirth(Integer.parseInt(input.nextLine()));
        break;
      }catch(NumberFormatException numberException) {
        System.out.println("Năm sinh vừa nhập không hợp lệ!, mời nhập lại");
      }
    }
    
    while(true) {
      try {
        System.out.print("Phụ cấp  : ");
        employee.setAllowance(Integer.parseInt(input.nextLine()));
        break;
      }catch(NumberFormatException numberException) {
        System.out.println("Phụ cấp  vừa nhập không hợp lệ!, mời nhập lại");
      }
    }
  
    while(true) {
      try {
        System.out.print("Hệ số lương  : ");
        employee.setCoefficientsSalary(Integer.parseInt(input.nextLine()));
        break;
      }catch(NumberFormatException numberException) {
        System.out.println("Hệ số lương vừa nhập không hợp lệ!, mời nhập lại");
      }
    }
    
    input.close();
    
    return employee;
  }
  
  
}
