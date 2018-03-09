<%@ page import="com.ngoc.bookmanagement.controller.UploadController" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <form:form method="POST" action="/upload" enctype="multipart/form-data" modelAttribute="myFile">
        File: <input type="file" name="multipartFile" /> <br /> <br/>
        Description: <form:input path="description"/> <br />
        <input type="submit" value="Submit" />
    </form:form>


    <div>
            <img src="/files/image.jpg" height="500" width="500"/>
    </div>
</body>
</html>
