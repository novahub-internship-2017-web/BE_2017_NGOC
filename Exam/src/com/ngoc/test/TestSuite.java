package com.ngoc.test;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;

import com.ngoc.employee.EmployeeTest;
import com.ngoc.staff.StaffTest;
import com.ngoc.teacher.TeacherTest;

@RunWith(Suite.class)

@Suite.SuiteClasses({
   EmployeeTest.class,
   StaffTest.class,
   TeacherTest.class,
})

public class TestSuite {   
}  	