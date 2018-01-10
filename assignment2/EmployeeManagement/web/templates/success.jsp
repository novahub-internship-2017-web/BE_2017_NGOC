<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String successMessage = (String) session.getAttribute("successMessage");
%>
<style>
    #successMessage{
        background-color: #4cae4c;
        position: relative;
        border-radius: 5px;
        margin-top: 10px;
        height: 50px;
        list-style: none;
    }
</style>


<div class="row" <% if(successMessage == null){%> hidden <%}%>>
    <div class="col-sm-4"></div>
    <div class="col-sm-4">
        <ul id="successMessage">
            <%
                if(successMessage != null){
                    String[] messages = successMessage.split("\n");

                    for(String singleMessage : messages){
            %>
            <li style="color: white; text-align: center; padding-top: 15px;"><%=singleMessage%></li>
            <%
                    }

                    session.removeAttribute("successMessage");
                }
            %>
        </ul>
    </div>
    <div class="col-sm-4"></div>
</div>


<script>
    setTimeout(function () {
        document.getElementById('successMessage').hidden = true;
    }, 2500);
</script>


