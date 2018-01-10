<%@ page import="com.ngoc.model.StaffHelper" %>
<%@ page import="com.ngoc.model.TeacherHelper" %>
<%@ page import="com.ngoc.model.User" %><%--
  Created by IntelliJ IDEA.
  User: quangngoc430
  Date: 08/01/2018
  Time: 12:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create New Employee</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/templates/javascript/validate.js"></script>
</head>
<body>

    <%@include file="header.jsp"%>
    <%@include file="/templates/error.jsp"%>
    <%@include file="/templates/success.jsp"%>

    <div class="col-sm-2"></div>
    <form class="form-horizontal col-sm-8" action="<%=request.getContextPath()%>/Create-Employee" method="post" onsubmit="return checkToNext()">
        <div class="form-group">
            <label class="control-label col-sm-3">Loại nhân viên : </label>
            <div class="col-sm-5">
                <select class="form-control" name="typeOfEmployee" id="typeOfEmployee" onchange="chooseTypeEmployee()">
                    <option value="<%=User.STAFF_ACCESS%>" selected><%=User.STAFF_NAME%></option>
                    <option value="<%=User.TEACHER_ACCESS%>"><%=User.TEACHER_NAME%></option>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Username : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="username" id="username" onchange="validateUsername()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="usernameError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Password : </label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="password" id="password" onchange="validatePassword()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="passwordError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">RePassword : </label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="repassword" id="repassword" onchange="validateRepassword()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="repasswordError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Họ tên : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="fullname" id="fullname" onchange="validateFullname()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="fullnameError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Năm sinh : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="year_of_birth" id="yearOfBirth" value="1970" onchange="validateYearOfBirth()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="yearOfBirthError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Quê quán</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="country" id="country" value="" onchange="validateCountry()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="countryError"></label>
        </div>
        <div id="staffInfo">
            <div class="form-group">
                <label class="control-label col-sm-3">Phòng ban : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="department" id="department" onchange="validateDepartment()"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="departmentError"></label>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Số ngày công : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="days_of_work" id="daysOfWork" onchange="validateDaysOfWork()"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="daysOfWorkError"></label>
            </div>
        </div>
        <div id="teacherInfo" hidden>
            <div class="form-group">
                <label class="control-label col-sm-3">Khoa : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="major" id="major" onchange="validateMajor()"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="majorError"></label>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Số tiết dạy : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="number_of_lessons" id="numberOfLessons" onchange="validateNumberOfLessons()"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="numberOfLessonsError"></label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Hệ số lương : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="coefficients_salary" id="coefficientsSalary" value="" onchange="validateCoefficientsSalary()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="coefficientsSalaryError"></label>
        </div>
        <div id="levelStaff" class="form-group">
            <label class="control-label col-sm-3">Chức vụ : </label>
            <div class="col-sm-5">
                <select class="form-control" name="level">
                    <option value="<%=StaffHelper.HEAD_OF_DEPARTMENT_LEVEL%>" selected><%=StaffHelper.HEAD_OF_DEPARTMENT_NAME%></option>
                    <option value="<%=StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL%>"><%=StaffHelper.DEPUTY_OF_DEPARTMENT_NAME%></option>
                    <option value="<%=StaffHelper.STAFF_LEVEL%>"><%=StaffHelper.STAFF_NAME%></option>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div id="levelTeacher" class="form-group" hidden>
            <label class="control-label col-sm-3">Chức vụ : </label>
            <div class="col-sm-5">
                <select class="form-control" name="level">
                    <option value="<%=TeacherHelper.BACHELOR_LEVEL%>" selected><%=TeacherHelper.BACHELOR_NAME%></option>
                    <option value="<%=TeacherHelper.MATER_LEVEL%>"><%=TeacherHelper.MATER_NAME%></option>
                    <option value="<%=TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL%>"><%=TeacherHelper.DOCTOR_OF_PHILOSOPHY_NAME%></option>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-5">
                <input class="form-control btn btn-primary" type="submit" name="submit" value="Create"/>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>

    <script>
        function chooseTypeEmployee() {
            var type = document.getElementById("typeOfEmployee").value;
            var levelStaff = document.getElementById("levelStaff");
            var levelTeacher = document.getElementById("levelTeacher");
            var staffInfo = document.getElementById("staffInfo");
            var teacherInfo = document.getElementById("teacherInfo");

            switch (type){
                case "<%=User.STAFF_ACCESS%>":{
                    levelStaff.hidden = false;
                    staffInfo.hidden = false;
                    levelTeacher.hidden = true;
                    teacherInfo.hidden = true;
                }
                    break;

                case "<%=User.TEACHER_ACCESS%>":{
                    levelStaff.hidden = true;
                    staffInfo.hidden = true;
                    levelTeacher.hidden = false;
                    teacherInfo.hidden = false;
                }
                    break;
            }
        }

        function checkToNext() {
            var check = true;

            if(validateUsername() == false)
                check = false;

            if(validatePassword() == false)
                check = false;

            if(validateRepassword() == false)
                check = false;

            if(validateFullname() == false)
                check = false;

            if(validateYearOfBirth() == false)
                check = false;

            if(validateCountry() == false)
                check = false;

            if(validateCoefficientsSalary() == false)
                check = false;

            if(document.getElementById("typeOfEmployee").value == "<%=User.STAFF_ACCESS%>"){
                if(validateDepartment() == false)
                    check = false;

                if(validateDaysOfWork() == false)
                    check = false;
            }

            if(document.getElementById("typeOfEmployee").value == "<%=User.TEACHER_ACCESS%>"){
                if(validateMajor() == false)
                    check = false;

                if(validateNumberOfLessons() == false)
                    check = false;
            }

            if(check == true) {

                var r = confirm("Are you sure you want to create new staff?");

                return r;
            }
            else{
                return false;
            }
        }
    </script>
</body>
</html>
