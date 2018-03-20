<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>
    <h1>Spring Boot - Multiple file upload example - AJAX</h1>

    <form method="POST" enctype="multipart/form-data" id="fileUploadForm">
        <input type="text" name="extraField"/><br/><br/>
        <input type="file" name="files"/><br/><br/>
        <input type="submit" value="Submit" id="btnSubmit"/>
    </form>

    <script src="${pageContext.servletContext.contextPath}/js/jquery.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {

            $("#btnSubmit").click(function (event) {

                //stop submit the form, we will post it manually.
                event.preventDefault();

                fire_ajax_submit();

            });

        });

        function fire_ajax_submit() {

            // Get form
            var form = $('#fileUploadForm')[0];

            var data = new FormData(form);

            data.append("CustomField", "This is some extra data, testing");

            $("#btnSubmit").prop("disabled", true);

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/uploadFile",
                data: data,
                //http://api.jquery.com/jQuery.ajax/
                //https://developer.mozilla.org/en-US/docs/Web/API/FormData/Using_FormData_Objects
                processData: false, //prevent jQuery from automatically transforming the data into a query string
                contentType: false,
                cache: false,
                timeout: 600000,
                success: function (data) {

                    $("#result").text(data);
                    console.log("SUCCESS : ", data);
                    $("#btnSubmit").prop("disabled", false);

                },
                error: function (e) {

                    $("#result").text(e.responseText);
                    console.log("ERROR : ", e);
                    $("#btnSubmit").prop("disabled", false);

                }
            });

        }

    </script>

</body>
</html>
