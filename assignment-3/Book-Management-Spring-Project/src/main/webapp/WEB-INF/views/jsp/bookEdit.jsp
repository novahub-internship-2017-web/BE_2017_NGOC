<%@ page import="com.ngoc.bookmanagement.model.Book" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ page pageEncoding="UTF-8" contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
    <title>Book Edit</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>

        .form-bookEdit{
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

    <%
        Book book = (Book) request.getAttribute(Constant.bookAttribute);
        long id = book.getId();
    %>

    <%@ include file="_header.jsp"%>

    <div class="body">
        <%@ include file="_message.jsp"%>
        <form:form action="/book/${id}/edit" method="post" modelAttribute="book" cssClass="form-bookEdit">
            <h1 class="h3 mb-3 font-weight-normal" align="center">Book edit</h1>
            <div class="form-label-group">
                <form:input id="title" path="title" cssClass="form-control" placeholder="Title"/>
                <form:errors path="title" cssClass="error"/>
                <label for="title">Title</label>
            </div>
            <div class="form-label-group">
                <form:input id="author" path="author" cssClass="form-control" placeholder="Author"/>
                <form:errors path="author" cssClass="error"/>
                <label for="author">Author</label>
            </div>
            <div class="form-label-group">
                <form:textarea id="description" path="description" cssClass="form-control" placeholder="Description"/>
                <form:errors path="description" cssClass="error"/>
                <label for="description">Description</label>
            </div>
            <input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Update"/>
        </form:form>
    </div>

    <%@ include file="_footer.jsp"%>

</body>
</html>
