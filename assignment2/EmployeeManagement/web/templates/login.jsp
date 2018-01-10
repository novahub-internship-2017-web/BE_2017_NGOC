<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/templates/javascript/validate.js"></script>
</head>
<body>
    <%@ include file="/templates/error.jsp"%>

    <script>
        function confirmToNext() {
            var check = true;
            if(validateUsername() == false)
                check = false;

            if(validatePassword() == false)
                check = false;

            return check;
        }
    </script>

    <div class="row">
        <div class="col-sm-4"></div>
        <form action="/Login" method="post" class="form-horizontal col-sm-8" style="margin-top: 100px" onsubmit="return confirmToNext()">
            <div class="form-group">
                <label class="control-label col-sm-6" style="text-align: left">Username</label>
                <div class="col-sm-6"></div>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <input type="text" class="form-control" name="username" id="username" onchange="validateUsername();"/>
                </div>
                <label class="control-label col-sm-6" id="usernameError" style="text-align: left; color: red;"></label>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-6" style="text-align: left">Password</label>
                <div class="col-sm-6"></div>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <input type="password" class="form-control" name="password" id="password" onchange="validatePassword();"/>
                </div>
                <label class="control-label col-sm-6" id="passwordError" style="text-align: left; color: red;"></label>
            </div>
            <div class="form-group">
                <div class="col-sm-6">
                    <input class="btn btn-primary form-control" type="submit" name="submit" value="Login"/>
                </div>
                <div class="col-sm-6"></div>
            </div>
        </form>
        </div>
    </div>
</body>
</html>