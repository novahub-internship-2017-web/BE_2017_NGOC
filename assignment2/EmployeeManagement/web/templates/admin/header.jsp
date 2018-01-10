<%--
  Created by IntelliJ IDEA.
  User: quangngoc430
  Date: 08/01/2018
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%  // user login
    User currentUserLogin = (User) session.getAttribute("UserLogin");
%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="<%=request.getContextPath()%>/Users?id=<%=currentUserLogin.getId()%>">Profile</a>
        </div>

        <%if(currentUserLogin.getAccess() == User.ADMIN_ACCESS){%>
            <ul class="nav navbar-nav navbar-left">
                <li><a href="<%=request.getContextPath()%>/Management">Management</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li><a href="<%=request.getContextPath()%>/Create-Employee">Create</a></li>
            </ul>
        <%}%>
        <ul class="nav navbar-nav navbar-left">
            <li><a href="<%=request.getContextPath()%>/Change-Password">Change password</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right">
            <li><a href="<%=request.getContextPath()%>/Logout" onclick="return confirmToLogout()"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
        </ul>
    </div>
</nav>
