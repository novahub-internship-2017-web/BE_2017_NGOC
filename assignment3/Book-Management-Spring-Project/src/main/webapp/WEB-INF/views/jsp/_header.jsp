<%@ page import="com.ngoc.bookmanagement.model.User" %>
<%@ page import="com.ngoc.bookmanagement.constant.Constant" %>
<%User userLogin = (User) session.getAttribute("userLogin");%>

<% String url = request.getRequestURL().toString();%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="/"><i class="fa fa-home" style="font-size: 26px"></i> Home</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="nav navbar-nav mr-auto"></ul>
        <ul class="nav navbar-nav navbar-right">
            <% if(userLogin != null) {%>
                <% if(userLogin.getRole() == Constant.USER_ROLE) {%>
                    <li class="nav-item">
                        <a class="nav-link" href="/book/new"><i class="fa fa-plus-circle" style="font-size: 21px;"> New</i></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/book"><i class="fa fa-book" style="font-size: 21px;"> Books</i></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle" style="font-size:21px"></i> <%=userLogin.getEmail()%>
                        </a>
                        <div class="dropdown-menu" style="margin-top: 7px; " aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/user/<%=userLogin.getId()%>">Profile</a>
                            <a class="dropdown-item" href="/user/<%=userLogin.getId()%>/Change-Password">Change password</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>
                <% } else if (userLogin.getRole() == Constant.ADMIN_ROLE){ %>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin"><i class="fa fa-book" style="font-size: 21px;"> Users</i></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="fa fa-user-circle" style="font-size:21px"></i> <%=userLogin.getEmail()%>
                        </a>
                        <div class="dropdown-menu" style="margin-top: 7px; " aria-labelledby="navbarDropdownMenuLink">
                            <a class="dropdown-item" href="/admin/user/<%=userLogin.getId()%>">Profile</a>
                            <a class="dropdown-item" href="/admin/user/<%=userLogin.getId()%>/Change-Password">Change password</a>
                            <a class="dropdown-item" href="/logout">Logout</a>
                        </div>
                    </li>
                <% } %>
            <% } else {%>
                <li class="nav-item">
                    <a class="nav-link" href="/login"><i class="fa fa-sign-in" style="font-size:21px"></i> Sign in</a>
                </li>
            <% }%>
        </ul>

    </div>

</nav>

<!--->

<style>
    .add-on .input-group-btn > .btn {
        border-left-width:0;left:-2px;
        -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
        box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
    }
    /* stop the glowing blue shadow */
    .add-on .form-control:focus {
        box-shadow:none;
        -webkit-box-shadow:none;
        border-color:#cccccc;
    }
    .body{
        margin-top: 56px;
    }
    .errorValidation{
        color: red;
        font-size: 14px;
        font-style: italic;
    }
    .error{
        color: red;
    }
</style>

<style>
    :root {
        --input-padding-x: .75rem;
        --input-padding-y: .75rem;
    }

    .form-label-group {
        position: relative;
        margin-bottom: 1rem;
    }

    .form-label-group > input,
    .form-label-group > label {
        padding: var(--input-padding-y) var(--input-padding-x);
    }

    .form-label-group > textarea,
    .form-label-group > label {
        padding: var(--input-padding-y) var(--input-padding-x);
    }

    .form-label-group > label {
        position: absolute;
        top: 0;
        left: 0;
        display: block;
        width: 100%;
        margin-bottom: 0; /* Override default `<label>` margin */
        line-height: 1.5;
        color: #495057;
        border: 1px solid transparent;
        border-radius: .25rem;
        transition: all .1s ease-in-out;
        text-align: left;
    }

    .form-label-group input::-webkit-input-placeholder {
        color: transparent;
    }

    .form-label-group input:-ms-input-placeholder {
        color: transparent;
    }

    .form-label-group input::-ms-input-placeholder {
        color: transparent;
    }

    .form-label-group input::-moz-placeholder {
        color: transparent;
    }

    .form-label-group input::placeholder {
        color: transparent;
    }

    .form-label-group textarea::-webkit-input-placeholder {
        color: transparent;
    }

    .form-label-group textarea:-ms-input-placeholder {
        color: transparent;
    }

    .form-label-group textarea::-ms-input-placeholder {
        color: transparent;
    }

    .form-label-group textarea::-moz-placeholder {
        color: transparent;
    }

    .form-label-group textarea::placeholder {
        color: transparent;
    }

    .form-label-group input:not(:placeholder-shown) {
        padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
        padding-bottom: calc(var(--input-padding-y) / 3);
    }

    .form-label-group textarea:not(:placeholder-shown) {
        padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
        padding-bottom: calc(var(--input-padding-y) / 3);
    }

    .form-label-group input:not(:placeholder-shown) ~ label {
        padding-top: calc(var(--input-padding-y) / 3);
        padding-bottom: calc(var(--input-padding-y) / 3);
        font-size: 12px;
        color: #777;
    }

    .form-label-group textarea:not(:placeholder-shown) ~ label {
        padding-top: calc(var(--input-padding-y) / 3);
        padding-bottom: calc(var(--input-padding-y) / 3);
        font-size: 12px;
        color: #777;
    }
</style>