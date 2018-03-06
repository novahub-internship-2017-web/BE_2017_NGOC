<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <meta charset="utf-8"/>
    <style>
        .masthead{
            width: 100%;
            background: url("/images/bg-masthead.jpg");
            background-repeat: no-repeat;
            background-size: 100% 100%;
        }
    </style>
</head>
<body>
    <%@ include file="_header.jsp"%>

    <div class="masthead body">
        <%@ include file="_message.jsp"%>
        <div class="container" style="padding: 8rem 0px;">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h1 class="mb-5" style="text-align: center; " >Book Management</h1>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    <form action="/" method="post">
                        <div class="form-row">
                            <div class="col-12 col-md-9 mb-2 mb-md-0">
                                <div class="form-label-group">
                                    <input id="email" name="email" class="form-control form-control-lg" placeholder="Enter your email">
                                    <label for="email">Enter your email</label>
                                </div>
                            </div>
                            <div class="col-12 col-md-3">
                                <button type="submit" style="margin-top: 4px;" class="btn btn-block btn-lg btn-primary">Sign up!</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="_footer.jsp"%>
</body>
</html>
