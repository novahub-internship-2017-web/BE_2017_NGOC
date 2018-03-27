<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Login</title>
    <style>
        .form-signin{
            /*border: 1px solid ;*/
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
        <form:form action="/login" method="post" modelAttribute="user" id="form-signin" cssClass="form-signin" name="form-signin">
            <h1 class="h3 mb-3 font-weight-normal" align="center">Please sign in</h1>
            <div class="form-label-group">
                <form:input id="email" path="email" cssClass="form-control" placeholder="Email address"/>
                <form:errors path="email" cssClass="error"/>
                <label for="email">Email address</label>
            </div>
            <div class="form-label-group">
                <form:input id="password" path="password" cssClass="form-control" placeholder="Password" type="password"/>
                <form:errors path="password" cssClass="error"/>
                <label for="password">Password</label>
            </div>
            <input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Sign in"/>
        </form:form>
    </div>

    <%@ include file="_footer.jsp"%>
</body>
</html>
