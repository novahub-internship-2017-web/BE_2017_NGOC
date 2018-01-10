<%@ page import="com.ngoc.model.User" %><%--
  Created by IntelliJ IDEA.
  User: quangngoc430
  Date: 10/01/2018
  Time: 07:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change password</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/templates/javascript/validate.js"></script>
</head>
<body>
    <%
        User currentUser = (User) session.getAttribute("currentUser");
    %>

    <%@include file="header.jsp"%>
    <%@include file="/templates/error.jsp"%>
    <%@include file="/templates/success.jsp"%>

    <div class="col-sm-2"></div>
    <form class="form-horizontal col-sm-8" action="<%=request.getContextPath()%>/Change-Password" method="post" onsubmit="return checkToNext()">
        <div class="form-group">
            <label class="control-label col-sm-3">Current Password : </label>
            <div class="col-sm-5">
                <input class="form-control" type="password" name="currentPassword" id="currentPassword" onchange="validateCurrentPassword()"/>
            </div>
            <label class="control-label col-sm-4" style="text-align: left; color: red;" id="currentPasswordError"></label>
        </div>
        <div class="form-group">
            <label class="control-label col-sm-3">New Password : </label>
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
            <div class="col-sm-3"></div>
            <div class="col-sm-5">
                <input class="form-control btn btn-primary" type="submit" name="submit" value="Change Password"/>
            </div>
            <div class="col-sm-4"></div>
        </div>
    </form>

    <script>
        function checkToNext() {
            var check = true;

            if(validateCurrentPassword() == false)
                check = false;

            if(validatePassword() == false)
                check = false;

            if(validateRepassword() == false)
                check = false;

            return check;
        }
    </script>
</body>
</html>
