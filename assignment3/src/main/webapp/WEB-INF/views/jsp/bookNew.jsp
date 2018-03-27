<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
    <head>
        <title>Book New</title>
    </head>
    <body style="background-color: #E0E0E0">

        <%
            String title = "Create New Book";
        %>

        <%@ include file="_header.jsp"%>

        <%@ include file="_book.jsp"%>

        <%@ include file="_footer.jsp"%>

        <script src="/js/book.js"></script>

    </body>
</html>
