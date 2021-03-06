<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String error = (String) session.getAttribute("error");
%>
<style>
    #listErrorMessage{
        background-color: #d43f3a;
        position: relative;
        border-radius: 5px;
        margin-top: 10px;
        height: 50px;
        list-style: none;
    }
</style>


<div class="row" <% if(error == null){%> hidden <%}%>>
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
        <ul id="listErrorMessage">
            <%
                if(error != null){
                    String[] errors = error.split("\n");

                    for(String singleError : errors){
            %>
                        <li style="color: white; text-align: center; padding-top: 15px;"><%=singleError%></li>
            <%
                    }

                session.removeAttribute("error");
            }
            %>
        </ul>
    </div>
    <div class="col-sm-4"></div>
</div>


<script>
    setTimeout(function () {
    document.getElementById('listErrorMessage').hidden = true;
    }, 2500);
</script>

