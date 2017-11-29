package teacher;

public class Teacher {  
  private String fullname;
  private int yearOfBirth;
  private int city;
  private String major;
  private String level;
  private int allowance;
  private int numberOfLessons;
  private int coefficientsSalary;
  
  public Teacher() {
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

  public int getCity() {
    return city;
  }

  public void setCity(int city) {
    this.city = city;
  }

  public String getMajor() {
    return major;
  }

  public void setMajor(String major) {
    this.major = major;
  }

  public int getAllowance() {
    return allowance;
  }

  public void setAllowance(int allowance) {
    this.allowance = allowance;
  }

  public int getNumberOfLessons() {
    return numberOfLessons;
  }

  public void setNumberOfLessons(int numberOfLessons) {
    this.numberOfLessons = numberOfLessons;
  }

  public int getCoefficientsSalary() {
    return coefficientsSalary;
  }

  public void setCoefficientsSalary(int coefficientsSalary) {
    this.coefficientsSalary = coefficientsSalary;
  }
  
  public void setLevel(String level) {
    this.level = level;
  }
  
  public String getLevel() {
    return this.level;
  }
  
  public int getSalary() {
    return coefficientsSalary * 730 + allowance + numberOfLessons * 45;
  }
}
