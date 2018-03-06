<%@ page import="com.ngoc.bookmanagement.model.Book" %>
<%@ page import="java.util.List" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Books</title>
    <meta charset="UTF-8"/>
    <style>
        .container{
            margin-top: 100px;
        }
    </style>
</head>
<body style="background-color: #E0E0E0">

    <%@ include file="_header.jsp"%>
    <%
        String wordsSearch = (String) request.getAttribute(Constant.wordsSearch);

        wordsSearch = (wordsSearch == null) ? "" : wordsSearch;
    %>
    <%
        List<Book> bookList = (List<Book>) request.getAttribute(Constant.bookListAttribute);
        Book book;
        long id = ((User) request.getSession().getAttribute(Constant.userLoginSession)).getId();
    %>

    <div class="row mb-1" style="margin-top: 100px">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <form action="/book/<%=id%>/search" method="post">
                <div class="col-auto">
                    <label class="sr-only" for="inlineFormInputGroup">Username</label>
                    <div class="input-group mb-2">
                        <div class="input-group-prepend">
                            <div class="input-group-text"><i class="fa fa-search"></i> </div>
                        </div>
                        <input type="text" class="form-control" id="inlineFormInputGroup" placeholder="Search" name="<%=Constant.wordsSearch%>" value="<%=wordsSearch%>">
                    </div>
                </div>
            </form>
        </div>
        <div class="col-md-2"></div>
    </div>


    <div class="container body" >
        <%@ include file="_message.jsp"%>

        <%
            if (bookList != null && bookList.size() > 0){
            for(int i = 0; i < bookList.size(); i++){
                book = bookList.get(i);
        %>
        <div class="row mb-1">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <div class="card flex-md-row mb-4 box-shadow h-md-300">
                    <div class="card-body align-items-start" style="position: relative;">
                        <!--<strong class="d-inline-block mb-2 text-primary">World</strong>-->
                        <h3 class="mb-0">
                            <a class="card-title" href="/book/<%=book.getId()%>"><%=book.getTitle()%></a>
                        </h3>
                        <div class="card-subtitle mb-1 text-muted"><%=book.getAuthor()%></div>
                        <div style="word-wrap: break-word">
                            <p class="card-text" style="word-break: break-all;"><%=book.getDescription().substring(0, (book.getDescription().length() > 250) ? 250 : book.getDescription().length())%></p>
                        </div>
                        <div class="pull-right">
                            <a class="btn btn-primary" href="/book/<%=book.getId()%>/edit">Update</a>
                            <a class="btn btn-danger deleteBook" href="/book/<%=book.getId()%>/delete" onclick="showMenu(event, this)" bookTitle="<%=book.getTitle()%>">Delete</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-2"></div>
        </div>
        <%}%>
        <%} else {%>
            <div class="row mb-1">
                <div class="col-md-2"></div>
                <div class="col-md-8">
                <div align="center">
                    <a href="/book/new" style="font-size: 30px;"> Create new book</a>
                </div>
                </div>
                <div class="col-md-2"></div>
            </div>
        <%} %>
    </div>


    <script>
        function showMenu(event, element) {
            var bookTitle = element.getAttribute("bookTitle");
            if (!confirm("Do you want to delete book '" + bookTitle + "' ?")) {
                event.preventDefault();
            }
        }
    </script>
    <%@ include file="_footer.jsp"%>
</body>
</html>
