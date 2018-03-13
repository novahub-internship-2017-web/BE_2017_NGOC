<%@ page import="com.ngoc.bookmanagement.model.Book" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
    <head>
        <title>Book Edit</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body style="background-color: #E0E0E0">

        <%

            String title = "Edit Book";

        %>

        <%@ include file="_header.jsp"%>

        <%@ include file="_book.jsp"%>

        <%@ include file="_footer.jsp"%>

        <script src="/js/book.js"></script>

    </body>
</html>
