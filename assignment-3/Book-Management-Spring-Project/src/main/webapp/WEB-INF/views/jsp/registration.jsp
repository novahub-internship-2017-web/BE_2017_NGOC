<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Registration</title>
    <style>
        .form-signup{
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

    <%@ include file="_header.jsp"%>

    <div class="body">
        <%@ include file="_message.jsp"%>
        <form:form action="/registration" method="post" modelAttribute="user" cssClass="form-signup" id="form-registration">
            <h1 class="h3 mb-3 font-weight-normal" align="center">Sign up</h1>
            <div class="form-label-group">
                <form:input id="email" path="email" cssClass="form-control" placeholder="Email" onclick="hiringErrorBackend(this)"/>
                <form:errors path="email" cssClass="error"/>
                <label for="email">Email address</label>
            </div>
            <div class="form-label-group">
                <form:input id="password" path="password" type="password" cssClass="form-control" placeholder="Password" onclick="hiringErrorBackend(this)"/>
                <form:errors path="password" cssClass="error"/>
                <label for="password">Password</label>
            </div>
            <div class="form-label-group">
                <form:input id="matchingPassword" path="matchingPassword" type="password" cssClass="form-control" placeholder="Re-password" onclick="hiringErrorBackend(this)"/>
                <form:errors path="matchingPassword" cssClass="error"/>
                <label for="matchingPassword">Repassword</label>
            </div>
            <div class="form-label-group">
                <form:input id="firstName" path="firstName" cssClass="form-control" placeholder="First name"/>
                <form:errors path="firstName" cssClass="error"/>
                <label for="firstName">First name</label>
            </div>
            <div class="form-label-group">
                <form:input id="lastName" path="lastName" cssClass="form-control" placeholder="Last name"/>
                <form:errors path="lastName" cssClass="error"/>
                <label for="lastName">Last name</label>
            </div>
            <input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Sign up"/>
        </form:form>

        <%@ include file="_footer.jsp"%>
    </div>
</body>
</html>
