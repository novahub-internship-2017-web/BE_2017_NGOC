package com.ngoc.employee;

import java.util.Scanner;

public abstract class Employee {
  protected String fullname;
  protected int yearOfBirth;
  protected String city;
  protected double coefficientsSalary;
  protected double allowance;
  protected int level;
  
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
	
  public double getCoefficientsSalary() {
    return coefficientsSalary;
  }
	
  public void setCoefficientsSalary(double coefficientsSalary) {
    this.coefficientsSalary = coefficientsSalary;
  }
	
  public double getAllowance() {
    return allowance;
  }
	
  public void setAllowance(double allowance) {
    this.allowance = allowance;
  }
  
  public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void inputData() {
    
    Scanner input = new Scanner(System.in);
    
    System.out.print("Họ tên : ");
    this.setFullname(input.nextLine());
    
    System.out.print("Thành phố : ");
    this.setCity(input.nextLine());
    
    while(true) {
    	System.out.print("Năm sinh : ");
    	
      try {        
        yearOfBirth  = Integer.parseInt(input.nextLine());
        
        if(yearOfBirth < 1900) {
        	System.out.println("Năm sinh phải >= 1900!, mời nhập lại");
        }
        else {
        	break;
        }
      }catch(NumberFormatException numberException) {
        System.out.println("Năm sinh vừa nhập không hợp lệ!, mời nhập lại");
      }
    }    
  
    while(true) {
    	System.out.print("Hệ số lương  : ");
    	
      try {
        coefficientsSalary = Double.parseDouble(input.nextLine());
        
        if(coefficientsSalary < 0) {
        	System.out.println("Hệ số lương vừa nhập không hợp lệ!, mời nhập lại");
        }
        else {
        	break;
        }
      }catch(NumberFormatException numberException) {
        System.out.println("Hệ số lương vừa nhập không hợp lệ!, mời nhập lại");
      }
    }
  }
  
  public abstract double getSalary();
}
