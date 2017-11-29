package employee;

public class Employee {
  protected String fullname;
  protected int yearOfBirth;
  protected String city;
  protected String level;
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
	
  public String getLevel() {
    return level;
  }
	
  public void setLevel(String level) {
    this.level = level;
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
  
  
  
}
