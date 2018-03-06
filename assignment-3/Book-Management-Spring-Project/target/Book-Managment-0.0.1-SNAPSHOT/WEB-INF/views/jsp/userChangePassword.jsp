<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Change Password</title>
    <style>
        .form-changePassword{
            border-radius: 5px;
            background-color: white;
            width: 100%;
            max-width: 500px;
            margin:150px auto;
            padding: 50px;
        }
    </style>
</head>
<body style="background-color: #E0E0E0">

    <% long id = (Long) request.getAttribute(Constant.idAttribute);%>
    <%@ include file="_header.jsp"%>

    <div class="body">
        <%@ include file="_message.jsp"%>
        <form:form action="/user/${id}/Change-Password" method="post" modelAttribute="user" cssClass="form-changePassword" onsubmit="return confirmSubmit();">
            <h1 class="h3 mb-3 font-weight-normal" align="center">Change password</h1>
            <div class="form-label-group">
                <form:input id="password" path="password" cssClass="form-control" type="password" placeholder="Old password" onclick="hiringErrorBackend(this)"/>
                <form:errors path="password" cssClass="error"/> <!--password.errors-->
                <label for="password">Old password</label>
            </div>
            <div class="form-label-group">
                <form:input id="matchingPassword" path="matchingPassword" cssClass="form-control" type="password" placeholder="New password" onclick="hiringErrorBackend(this)"/>
                <form:errors path="matchingPassword" cssClass="error"/>
                <label for="matchingPassword">New password</label>
            </div>
            <div class="form-label-group">
                <form:input id="rePassword" path="rePassword" cssClass="form-control" type="password" placeholder="Renew password" onclick="hiringErrorBackend(this)"/>
                <form:errors path="rePassword" cssClass="error"/>
                <label for="rePassword">Renew Password</label>
            </div>
            <input type="submit" class="btn btn-lg btn-primary btn-block" name="submit" value="Change Password"/>
        </form:form>
    </div>

    <script>
        function confirmSubmit() {
            return confirm("Do you want to change password ?");
        }
    </script>

    <%@ include file="_footer.jsp"%>
</body>
</html>
