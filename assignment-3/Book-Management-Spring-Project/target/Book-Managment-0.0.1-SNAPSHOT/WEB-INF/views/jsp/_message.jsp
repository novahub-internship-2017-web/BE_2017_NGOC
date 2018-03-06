<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%
    String errorMessage = (String) request.getAttribute(Constant.errorMessageSession);
    String successMessage = (String) request.getAttribute(Constant.successMessageSession);
%>

<%  if(errorMessage != null){%>
    <div class="alert alert-danger alert-dismissable notiMessage">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Danger!</strong> <%=errorMessage%>.
    </div>
<%
    request.removeAttribute(Constant.errorMessageSession);
}%>

<%  if(successMessage != null){%>
    <div class="alert alert-success alert-dismissable notiMessage">
        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
        <strong>Success!</strong> <%=successMessage%>.
    </div>
<%
    request.removeAttribute(Constant.successMessageSession);
}%>

<%--<script>--%>
    <%--setTimeout(function() {--%>
        <%--$(".notiMessage").remove();--%>
    <%--}, 2500);--%>
<%--</script>--%>