<%@ page import="com.ngoc.model.*" %>
<%@ page import="com.ngoc.util.DBHelper" %>
<%@ page import="java.sql.Connection" %><%--
  Created by IntelliJ IDEA.
  User: quangngoc430
  Date: 08/01/2018
  Time: 14:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update employee</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/templates/javascript/validate.js"></script>
</head>
<body>
    <%
        User currentUser = (User) session.getAttribute("currentUser");
        User userLogin = (User) session.getAttribute("UserLogin");
        Staff staff = null;
        Teacher teacher = null;
        String fullname = "", country = "", department = "", major = "";
        int yearOfBirth = 1970, dayOfWorks = 0, numberOfLessons = 0;
        double coefficientsSalary = 0, allowance = 0;
        if(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS){
            staff = (Staff) session.getAttribute("currentStaff");
            fullname = staff.getFullname();
            yearOfBirth = staff.getYearOfBirth();
            country = staff.getCountry();
            department = staff.getDepartment();
            dayOfWorks = staff.getDaysOfWork();
            coefficientsSalary = staff.getCoefficientsSalary();
            allowance = staff.getAllowance();
        }
        else{
            teacher = (Teacher) session.getAttribute("currentTeacher");
            fullname = teacher.getFullname();
            yearOfBirth = teacher.getYearOfBirth();
            country = teacher.getCountry();
            major = teacher.getMajor();
            numberOfLessons = teacher.getNumberOfLessons();
            coefficientsSalary = teacher.getCoefficientsSalary();
            allowance = teacher.getAllowance();
        }
    %>

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

            <%if((userLogin.getAccess() == User.ADMIN_ACCESS)){%>
                if(document.getElementById("changingPassword").value == 2) {
                    if (validatePassword() == false)
                        check = false;

                    if (validateRepassword() == false)
                        check = false;
                }
            <%}%>

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

                var r = confirm("Are you sure you want to update Employee?");

                return r;
            }
            else{
                return false;
            }
        }

        function chooseChangingPassword() {
            var changingPassword = document.getElementById("changingPassword").value;

            if(changingPassword == 1){
                document.getElementById("passwordGroup").hidden = true;
            }

            if(changingPassword == 2){
                document.getElementById("passwordGroup").hidden = false;
            }
        }
    </script>

    <%@include file="header.jsp"%>
    <%@include file="/templates/error.jsp"%>
    <%@include file="/templates/success.jsp"%>

    <div class="col-sm-2"></div>
    <form class="form-horizontal col-sm-8" action="<%=request.getContextPath()%>/Users" method="post" onsubmit="return checkToNext()">
        <div class="form-group" >
            <label class="control-label col-sm-3">Loại nhân viên : </label>
            <div class="col-sm-5">
                <select class="form-control" name="typeOfEmployee" id="typeOfEmployee" onchange="chooseTypeEmployee()" <%if(currentUser.getAccess() == User.ADMIN_ACCESS){%> disabled<%}%>>
                    <option value="<%=User.STAFF_ACCESS%>" <%if(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS){%> selected <%}%>><%=User.STAFF_NAME%></option>
                    <option value="<%=User.TEACHER_ACCESS%>" <%if(currentUser.getAccess() == User.TEACHER_ACCESS){%> selected <%}%>><%=User.TEACHER_NAME%></option>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Username : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="username" id="username" disabled onchange="validateUsername()" value="<%=currentUser.getUsername()%>"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="usernameError"></label>
        </div>
        <div id="changingPasswordGroup" <%if(!(userLogin.getAccess() == User.ADMIN_ACCESS)){%> hidden <%}%>>
            <div class="form-group">
                <label class="control-label col-sm-3">Đổi mật khẩu : </label>
                <div class="col-sm-5">
                    <select class="form-control" name="changingPassword" id="changingPassword" onchange="chooseChangingPassword()">
                        <option value="1" selected> Không</option>
                        <option value="2">Có</option>
                    </select>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div id="passwordGroup" hidden>
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
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Họ tên : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="fullname" id="fullname" onchange="validateFullname()" value="<%=(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS) ? staff.getFullname() : teacher.getFullname()%>"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="fullnameError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Năm sinh : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="year_of_birth" id="yearOfBirth" onchange="validateYearOfBirth()" value="<%=(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS) ? staff.getYearOfBirth() : teacher.getYearOfBirth()%>"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="yearOfBirthError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Quê quán</label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="country" id="country" onchange="validateCountry()" value="<%=(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS) ? staff.getCountry() : teacher.getCountry()%>"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="countryError"></label>
        </div>
        <div id="staffInfo" <%if(!(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS)){%> hidden <%}%>>
            <div class="form-group">
                <label class="control-label col-sm-3">Phòng ban : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="department" id="department" onchange="validateDepartment()" value="<%=(staff != null) ? staff.getDepartment() : ""%>"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="departmentError"></label>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Số ngày công : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="days_of_work" id="daysOfWork" onchange="validateDaysOfWork()" value="<%=(staff != null) ? staff.getDaysOfWork() : 0%>"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="daysOfWorkError"></label>
            </div>
        </div>
        <div id="teacherInfo" <%if(!(currentUser.getAccess() == User.TEACHER_ACCESS)){%> hidden <%}%>>
            <div class="form-group">
                <label class="control-label col-sm-3">Khoa : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="major" id="major" onchange="validateMajor()" value="<%=((teacher != null) ? teacher.getMajor() : "")%>"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="majorError"></label>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-3">Số tiết dạy : </label>
                <div class="col-sm-5">
                    <input class="form-control" type="text" name="number_of_lessons" id="numberOfLessons" onchange="validateNumberOfLessons()" value="<%=((teacher != null) ? teacher.getNumberOfLessons() : "" )%>"/>
                </div>
                <label class="control-label col-sm-4" style="text-align: left; color: red;" id="numberOfLessonsError"></label>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">Hệ số lương : </label>
            <div class="col-sm-5">
                <input class="form-control" type="text" name="coefficients_salary" id="coefficientsSalary" onchange="validateCoefficientsSalary()" value="<%=(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS) ? staff.getCoefficientsSalary() : teacher.getCoefficientsSalary()%>"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="coefficientsSalaryError"></label>
        </div>
        <div id="levelStaff" class="form-group" <%if(!(currentUser.getAccess() == User.STAFF_ACCESS || currentUser.getAccess() == User.ADMIN_ACCESS)){%> hidden <%}%>>
            <label class="control-label col-sm-3">Chức vụ : </label>
            <div class="col-sm-5">
                <select class="form-control" name="levelStaff" <%if(currentUser.getAccess() == User.ADMIN_ACCESS){%> disabled <%}%>>
                    <option value="<%=StaffHelper.HEAD_OF_DEPARTMENT_LEVEL%>" <%if(staff != null && staff.getLevel() == StaffHelper.HEAD_OF_DEPARTMENT_LEVEL){%> selected <%}%>><%=StaffHelper.HEAD_OF_DEPARTMENT_NAME%></option>
                    <option value="<%=StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL%>" <%if(staff != null && staff.getLevel() == StaffHelper.DEPUTY_OF_DEPARTMENT_LEVEL){%> selected <%}%>><%=StaffHelper.DEPUTY_OF_DEPARTMENT_NAME%></option>
                    <option value="<%=StaffHelper.STAFF_LEVEL%>" <%if(staff != null && staff.getLevel() == StaffHelper.STAFF_LEVEL){%> selected <%}%>><%=StaffHelper.STAFF_NAME%></option>
                    <%if(currentUser.getAccess() == User.ADMIN_ACCESS){%>
                        <option value="<%=StaffHelper.ADMIN_LEVEL%>" <%if(staff != null && staff.getLevel() == StaffHelper.ADMIN_LEVEL){%> selected <%}%>><%=StaffHelper.ADMIN_NAME%></option>
                    <%}%>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>
        <div id="levelTeacher" class="form-group" <%if(!(currentUser.getAccess() == User.TEACHER_ACCESS)){%> hidden <%}%>>
            <label class="control-label col-sm-3">Chức vụ : </label>
            <div class="col-sm-5">
                <select class="form-control" name="levelTeacher">
                    <option value="<%=TeacherHelper.BACHELOR_LEVEL%>" <%if(teacher != null && teacher.getLevel() == TeacherHelper.BACHELOR_LEVEL){%> selected <%}%>><%=TeacherHelper.BACHELOR_NAME%></option>
                    <option value="<%=TeacherHelper.MATER_LEVEL%>" <%if(teacher != null && teacher.getLevel() == TeacherHelper.MATER_LEVEL){%> selected <%}%>><%=TeacherHelper.MATER_NAME%></option>
                    <option value="<%=TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL%>" <%if(teacher != null && teacher.getLevel() == TeacherHelper.DOCTOR_OF_PHILOSOPHY_LEVEL){%> selected <%}%>><%=TeacherHelper.DOCTOR_OF_PHILOSOPHY_NAME%></option>
                </select>
            </div>
            <div class="col-sm-4"></div>
        </div>

        <div class="form-group">
            <div class="col-sm-3"></div>
            <div class="col-sm-5">
                <input class="form-control btn btn-primary" type="submit" name="submit" value="Update"/>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>
</body>
</html>

