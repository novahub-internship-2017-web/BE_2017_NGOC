<%@ page import="java.util.ArrayList" %>
<%@ page import="com.ngoc.model.*" %><%--
  Created by IntelliJ IDEA.
  User: quangngoc430
  Date: 26/12/2017
  Time: 11:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
    <%
        ArrayList<User> userArrayList = (ArrayList<User>) session.getAttribute("resultOfSearching");
        String word = request.getParameter("word");

        if(word == null)
            word = "";
    %>

    <%@include file="header.jsp"%>
    <%@include file="/templates/error.jsp"%>
    <%@include file="/templates/success.jsp"%>

    <div class="col-sm-1"></div>
    <div class="col-sm-10">

        <form class="input-group" role="search" method="post">
                <input type="text" class="form-control" value="<%=word%>" name="words" id="srch-term">
                <div class="input-group-btn">
                    <button class="btn btn-default form-control" type="submit"><i class="glyphicon glyphicon-search"></i></button>
                </div>
        </form>

        <%
            if(userArrayList != null){
            Teacher teacher = null;
            Staff staff = null;
        %>
            <table style="width:100%" class="table table-bordered">
                <tr>
                   <th>ID</th>
                   <th>Tên</th>
                   <th>Năm Sinh</th>
                   <th>Quê Quán</th>
                   <th>Loại</th>
                   <th>C1</th>
                   <th>C2</th>
                   <th>C3</th>
                   <th>C4</th>
                   <th>C5</th>
                   <th>C6</th>
                   <th>Thao tác</th>
                </tr>
        <%
            for(User user : userArrayList){
                if(user.getAccess() == User.TEACHER_ACCESS) {
                    teacher = (Teacher) user;
                } else {
                    staff = (Staff) user;
                }
        %>

                <tr>
                    <td><%=user.getId()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getFullname() : staff.getFullname()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getYearOfBirth() : staff.getYearOfBirth()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getCountry() : staff.getYearOfBirth()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? "GV" : "NV"%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getMajor() : staff.getDepartment()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? TeacherHelper.getNameLevel(teacher.getLevel()) : StaffHelper.getNameLevel(staff.getLevel())%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getAllowance() : staff.getAllowance()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getNumberOfLessons() : staff.getDaysOfWork()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getCoefficientsSalary() : staff.getCoefficientsSalary()%></td>
                    <td><%=(user.getAccess() == User.TEACHER_ACCESS) ? teacher.getSalary() : staff.getSalary()%></td>
                    <td>
                        <a class="btn btn-success" href="<%=request.getContextPath()%>/Users?id=<%=user.getId()%>">Sửa</a>
                        <%  if(user.getAccess() == User.TEACHER_ACCESS || user.getAccess() == User.STAFF_ACCESS){%>
                            <a class="btn btn-danger" href="<%=request.getContextPath()%>/Delete?id=<%=user.getId()%>" onclick="return confirmDeleteUser()">xóa</a>
                        <%  }%>
                    </td>
                </tr>
        <%  }
        }else{
        %>
            <h1>Không tìm thấy kết quả nào cả!</h1>
        <%}%>
        </table>
    </div>
    <div class="col-sm-1"></div>

    <script>
        function confirmDeleteUser() {
            var r = confirm("Bạn có chắc chắn muốn xóa user này?");

            return r;
        }

        function  confirmToLogout() {
            var r = confirm("Are you sure you want to logout?");

            return r;
        }
    </script>

    <%
        session.removeAttribute("resultOfSearching");
    %>
</body>
</html>
