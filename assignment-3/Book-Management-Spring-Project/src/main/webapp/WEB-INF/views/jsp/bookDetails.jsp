<%@ page import="com.ngoc.bookmanagement.model.Book" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Book Details</title>
    <style>
        .book-detail{
            border-radius: 5px;
            background-color: white;
            margin:30px auto;
            padding: 30px 0px;
        }
    </style>
</head>
<body style="background-color: #E0E0E0">
    <%
        Book book = (Book) request.getAttribute(Constant.bookAttribute);
        String bookCoverUrl = (String) request.getAttribute(Constant.bookCoverUrlAttribute);

        if(bookCoverUrl == null)
            bookCoverUrl = "/book-covers/no-image.jpg";
    %>

    <%@ include file="_header.jsp"%>

    <div class="body">
        <%@ include file="_message.jsp"%>
        <div class="row" style="margin-top: 100px;">
            <div class="col-md-3"></div>
            <div class="col-md-6 book-detail">
                <img id="bookCoverImage" src="<%=bookCoverUrl%>" class="h3 mb-3 pull-left" style="margin-right: 30px; width: 200px; height: 200px; border: 1px solid black;" />
                <h1 style="margin-top: 35px"><%=book.getTitle()%></h1>
                <p style="margin-top: -10px"><%=book.getAuthor()%></p>
                <%
                    String dateUpdated = book.getUpdated_at().toString();
                    dateUpdated = (dateUpdated.split(" "))[0];
                %>
                <p style="margin-top: -20px; font-size: 14px; color: gray;"><%=dateUpdated%></p>
                <br/>
                <p style="word-wrap: break-word; margin-top: -30px;"><%=book.getDescription()%></p>
                <div class="pull-right">
                    <a class="btn btn-primary" href="/book/<%=book.getId()%>/edit">Update</a>
                    <a class="btn btn-danger deleteBook" href="/book/<%=book.getId()%>/delete" onclick="return confirm('Do you want to delete this book ?');">Delete</a>
                </div>
            </div>
            <div class="col-md-3"></div>
        </div>
    </div>

    <%@ include file="_footer.jsp"%>
</body>
</html>
