<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin</title>
</head>
<body>
    <%@ include file="_header.jsp"%>
    <%@ include file="_message.jsp"%>

    <div class="body container" style="margin-top: 100px">
        <table class="table table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Email</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
            <%
                List<User> usersList = (List<User>) request.getAttribute(Constant.userListAttribute);
                User user;
                if(usersList != null) {
                    for(int i = 0; i < usersList.size(); i++){
                        user = usersList.get(i);
            %>
                    <tr>
                        <th scope="row"><%=user.getId()%></th>
                        <td><a href="/admin/user/<%=user.getId()%>"><%=user.getEmail()%></a></td>
                        <td><%=user.getFirstName()%></td>
                        <td><%=user.getLastName()%></td>
                        <td>
                            <% if(user.getStatus() == Constant.UNLOCK) {%>
                                <a href="/admin/user/<%=user.getId()%>/lock" class="btn btn-primary">Lock</a>
                            <% } else { %>
                                <a href="/admin/user/<%=user.getId()%>/unlock" class="btn btn-primary">Unlock</a>
                            <% } %>
                        </td>
                    </tr>
                <%  } %>
                <%}   %>
            </tbody>
        </table>
    </div>

    <%@ include file="_footer.jsp"%>
</body>
</html>
