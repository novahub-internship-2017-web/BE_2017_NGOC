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
        <form:form action="<%=(String) request.getAttribute(Constant.urlRewriteAttribute)%>"
                   method="post" modelAttribute="user" cssClass="form-user" enctype="multipart/form-data">
            <div align="center">
                <img id="avatar" class="h3 mb-3 center-block" style="width: 200px; height: 200px; border-radius: 50%; border: 1px solid black;" />
            <div/>

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

            <input id="uploadImage" name="avatar" class="form-control-file" type="file" name="myPhoto" onchange="PreviewImage();" title="" />

            <div>
                <input type="submit" name="submit" class="btn btn-lg btn-primary btn-block" value="Update"/>
            </div>
        </form:form>
    </div>

    <%@ include file="_footer.jsp"%>

    <script type="text/javascript">

        function PreviewImage() {
            var oFReader = new FileReader();
            oFReader.readAsDataURL(document.getElementById("uploadImage").files[0]);

            oFReader.onload = function (oFREvent) {
                document.getElementById("avatar").src = oFREvent.target.result;
            };
        };

        $('#avatar').on('click', function(){
            $('#uploadImage').trigger('click');
        });

    </script>

    <style>
        #uploadImage{
            display: none;
        }
    </style>
</body>
</html>
