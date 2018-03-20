


<%
    String urlRewrite = (String) request.getAttribute(Constant.urlRewriteAttribute);

    String bookCoverUrl = (String) request.getAttribute(Constant.bookCoverUrlAttribute);

    bookCoverUrl = (bookCoverUrl == null) ? "/book-covers/no-image.jpg" : bookCoverUrl;
%>

<div class="body">
    <%@ include file="_message.jsp"%>

    <form:form method="post" modelAttribute="book" id="form-book" name="form-book" cssClass="form-book" enctype="multipart/form-data">
        <h1 class="h3 mb-3 font-weight-normal" align="center"><%=title%></h1>

        <div align="center">
            <img id="bookCoverImage" src="<%=bookCoverUrl%>" class="h3 mb-3 center-block" style="width: 200px; height: 200px; border-radius: 50%; border: 1px solid black;" />
        </div>

        <div class="form-label-group">
            <form:input path="title" cssClass="form-control" placeholder="Title"/>
            <form:errors path="title" cssClass="error"/>
            <label for="title">Title</label>
        </div>
        <div class="form-label-group">
            <form:input path="author" cssClass="form-control" placeholder="Author"/>
            <form:errors path="author" cssClass="error"/>
            <label for="author">Author</label>
        </div>
        <div class="form-label-group">
            <form:textarea path="description" cssClass="form-control" rows="5" placeholder="Description"/>
            <form:errors path="description" cssClass="error"/>
            <label for="description">Description</label>
        </div>

        <input id="uploadImage" name="bookCoverImage" class="form-control-file" type="file" onchange="PreviewImage();"/>

        <input type="submit" class="btn btn-lg btn-primary btn-block" id="btnSubmit" name="submit" value="Create"/>
    </form:form>
</div>

<style>
    #uploadImage{
        display: none;
    }

    .form-book{
        border-radius: 5px;
        background-color: white;
        width: 100%;
        max-width: 500px;
        margin:150px auto;
        padding: 50px;
    }
</style>