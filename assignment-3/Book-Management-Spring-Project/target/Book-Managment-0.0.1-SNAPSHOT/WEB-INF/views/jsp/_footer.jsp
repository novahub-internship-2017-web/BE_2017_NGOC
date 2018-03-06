<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/css/bootstrap.css"/>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="${pageContext.servletContext.contextPath}/js/jquery.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/jquery-validate.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/bootstrap.js"></script>
<script src="${pageContext.servletContext.contextPath}/js/additional-methods.js"></script>

<%  String currentUrl = (String) request.getAttribute(Constant.urlRewriteAttribute);
    if(!currentUrl.equals("/")) {%>
<script>
    $(document).ready(function () {
        $('form').each(function () {
            $(this).validate({
                errorElement: 'span',
                errorClass: 'errorValidation',
                rules: {
                    email: {
                        required: true,
                        email: true,
                        maxlength: 50
                    },

                    password: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                    },
                    <% if(!currentUrl.endsWith("/Change-Password")) { %>
                    matchingPassword: {
                        equalTo: "#password",
                    },
                    <% } else { %>
                    matchingPassword: {
                        required: true,
                        minlength: 6,
                        maxlength: 20,
                    },
                    rePassword: {
                        equalTo: "#matchingPassword",
                    },
                    <% } %>
                    title: {
                        required: true,
                        maxlength: 200,
                    },
                    author: {
                        required: true,
                        maxlength: 50,
                    },
                    description: {
                        maxlength: 1000,
                    },
                },
                messages: {
                    email: {
                        required: "Email isn't blank",
                        email: "Please enter a valid email address.",
                        maxlength: "Please enter no more than 50 characters",
                    },
                    password: {
                        required: "Password isn't blank",
                        minlength: "Please enter at least 6 characters",
                        maxlength: "Please enter no more than 20 characters",
                    },
                    <% if(!currentUrl.endsWith("/Change-Password")) { %>
                    matchingPassword: {
                        equalTo: "Two passwords don't equal",
                    },
                    <% } else { %>
                    matchingPassword: {
                        required: "Password isn't blank",
                        minlength: "Please enter at least 6 characters",
                        maxlength: "Please enter no more than 20 characters",
                    },
                    rePassword: {
                        equalTo: "Two passwords don't equal",
                    },
                    <% } %>
                    title: {
                        required: "Title isn't blank",
                        maxlength: "Please enter no more than 200 characters",
                    },
                    author: {
                        required: "Author isn't blank",
                        maxlength: "Please enter no more than 200 characters",
                    },
                    description: {
                        maxlength: "Please enter no more than 500 characters",
                    },
                },
                highlight: function (element) {
                    // add a class "has_error" to the element
                    $(element).addClass("is-invalid");
                    $(element).removeClass("is-valid")
                },
                unhighlight: function (element) {
                    // remove the class "has_error" from the element
                    $(element).addClass("is-valid");
                    $(element).removeClass("is-invalid");
                },
                // submitHandler: function(form) {
                //     form.submit();
                // },
            });
        });
    });


    <!-- This code use to hire errors from back-end-->
    function hiringErrorBackend(element){
        var idElementError = element.id + ".errors";
        document.getElementById(idElementError).style.display = 'none';
    }
</script>
<%}%>