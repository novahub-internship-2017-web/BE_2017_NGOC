package employee;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

public class EmployeeTest {
  @Test
  public void testDefaultConstructor() {
    Employee employee = new Employee();
    employee.setCity("Da Nang");
   
    assertEquals("Da Nang", employee.getCity());;
  }
  
  @Test
  public void testGetAllowance() {
    Employee employee = new Employee();
    employee.setAllowance(1050000);
    
    assertEquals(1050000, employee.getAllowance());
  }
  
  @Test
  public void testSetAllowance() {
    Employee employee = new Employee();
    employee.setAllowance(2796044);
    
    assertEquals(2796844, employee.getAllowance());
  }
}
