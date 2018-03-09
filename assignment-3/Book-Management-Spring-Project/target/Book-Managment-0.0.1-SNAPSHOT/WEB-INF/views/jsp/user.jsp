<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Profile</title>
    <style>
        .form-user{
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
        <form:form action="<%=(String) request.getAttribute(Constant.urlRewriteAttribute)%>" method="post" modelAttribute="user" cssClass="form-user">
            <h1 align="center" class="h3 mb-3 font-weight-normal">Profile</h1>
            <div class="form-label-group">
                <form:input id="email" path="email" cssClass="form-control" placeholder="Email address" disabled="true"/>
                <form:errors path="email" cssClass="error"/>
                <label for="email">Email address</label>
            </div>
            <div class="form-label-group">
                <form:input path="firstName" cssClass="form-control"/>
                <form:errors path="firstName" cssClass="error"/>
                <label for="firstName">First name</label>
            </div>
            <div class="form-label-group">
                <form:input path="lastName" cssClass="form-control"/>
                <form:errors path="lastName" cssClass="error"/>
                <label for="lastName">Last name</label>
            </div>
            <input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Update"/>
        </form:form>
    </div>

    <%@ include file="_footer.jsp"%>
</body>
</html>
