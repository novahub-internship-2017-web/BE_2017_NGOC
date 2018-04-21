const BTN_SIGN_UP_PRESSED = 1;
const BTN_SIGN_IN_PRESSED = 2;

const OK = 0;
const EMAIL_IS_EXIST = 11;
const EMAIL_OR_PASSWORD_WRONG = 12;

const ROLE_ADMIN = "ADMIN";
const ROLE_USER = "USER";

var stateButtonFormLoginPressed;

$("#login-form").click( function(event){
    $("#alert-error-message").hide();
    $("#alert-success-message").hide();
});

$("#btn-sign-up").click( function(envet){
    $("#form-title").text("Please Sign Up");
    $("#re-password").prop("disabled", false);
    $("#first-name").prop("disabled", false);
    $("#last-name").prop("disabled", false);
    $("#group-repassword").show();
    $("#group-first-name").show();
    $("#group-last-name").show();
    $("#btn-action").val("Sign up");

    if(stateButtonFormLoginPressed != BTN_SIGN_UP_PRESSED){
        clearForm();
        clearErrorMessages();
    }
    stateButtonFormLoginPressed = BTN_SIGN_UP_PRESSED;
    
});

$("#btn-sign-in").click( function(envet){
    $("#form-title").text("Please Sign In");
    $("#re-password").prop("disabled", true);
    $("#first-name").prop("disabled", true);
    $("#last-name").prop("disabled", true);            
    $("#group-repassword").hide();
    $("#group-first-name").hide();
    $("#group-last-name").hide();
    $("#btn-action").val("Sign in");

    if(stateButtonFormLoginPressed != BTN_SIGN_IN_PRESSED){
        clearForm();
        clearErrorMessages(); 
    }            

    stateButtonFormLoginPressed = BTN_SIGN_IN_PRESSED;
    
});

function clearErrorMessages(){
    $("#alert-success-message").hide();
    $("#alert-error-message").hide();
    $(".error").hide();
    $("#email").css("border-color", "#ced4da");
    $("#password").css("border-color", "#ced4da");
    $("#repassword").css("border-color", "#ced4da");
    $("#firstName").css("border-color", "#ced4da");
    $("#lastName").css("border-color", "#ced4da");
}

function clearForm(){
    $(".error").hide();
    $("#email").val("");
    $("#email").css("border-color", "#ced4da");
    $("#password").val("");
    $("#password").css("border-color", "#ced4da");
    $("#repassword").val("");
    $("#repassword").css("border-color", "#ced4da");
    $("#firstName").val("");
    $("#firstName").css("border-color", "#ced4da");
    $("#lastName").val("");
    $("#lastName").css("border-color", "#ced4da");
}

$("#login-form").submit(function(event) {
    event.preventDefault();
    var data;

    if(stateButtonFormLoginPressed == BTN_SIGN_UP_PRESSED){
        data = JSON.stringify({
            "email" : $('#email').val(),
            "password" : $('#password').val(),
            "firstName" : $('#first-name').val(),
            "lastName" : $('#last-name').val()
        });
    }

    if($("#login-form").valid() ) {
        switch(stateButtonFormLoginPressed){
            case BTN_SIGN_UP_PRESSED : 
                {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json",
                        url: window.location.origin + "/api/user",
                        data: data,
                        dataType: 'json',
                        timeout: 10000,
                        success: function (data) {
                            switch(data.code)
                            {
                                case OK:
                                    {                                                
                                        clearForm();    
                                        $("#exampleModal").modal('hide'); 
                                        $("#alert-success-message").show();
                                        $("#alert-error-message").hide();
                                    }
                                    break;

                                case EMAIL_IS_EXIST:
                                    {
                                        $("#alert-error-message").show();
                                        $("#alert-success-message").hide();
                                        $("#error-message").text("Email is exist");
                                    }
                                    break;
                            }
                                                           
                        },
                        error: function (e) {
                            // TODO: show message network 
                        }
                    });
                }
                break;
            case BTN_SIGN_IN_PRESSED :
                {
                    $.ajax({
                        type: "GET",
                        contentType: "application/json",
                        url: window.location.origin + "/api/user",
                        headers: 
                        {
                            "email"     : $('#email').val(), 
                            "password"  : $('#password').val()
                        },
                        dataType: 'json',
                        timeout: 10000,
                        success: function (data) {
                            switch(data.code)
                            {
                                case OK:
                                    {                                                
                                        if(data.object.name == ROLE_ADMIN){
                                            window.location.replace(window.location.origin + "/admin/home");
                                        } 

                                        if(data.object.name == ROLE_USER){
                                            window.location.replace(window.location.origin + "/user/home");
                                        }
                                    }
                                    break;

                                case EMAIL_OR_PASSWORD_WRONG:
                                    {
                                        $("#alert-error-message").show();
                                        $("#alert-success-message").hide();
                                        $("#error-message").text("Email or Password incorrect");
                                    }
                                    break;
                            }
                        },
                        error: function (e) {
                            $("#alert-error-message").show();
                            $("#alert-success-message").hide();
                            $("#error-message").text(e.responseJSON.message.trim());
                        }
                    });
                }
                break;
        }
    }
});

// validation
$(document).ready(function(s) {
    $("#login-form").validate({
        highlight : 
            function(element, errorClass) {
                $(element).css("border-color", "#d9534f");
            },
        unhighlight : 
            function(element, errorClass) {
                $(element).css("border-color", "#5cb85c");
            },
        rules:{
            email : {
                required: true,
                email: true
            },
            password: {
                required: true
            },
            repassword: {
                equalTo: "#password"
            }
        },
        messages :{
            email : {
                required: "Email is not empty",
                email: "Your email address must be in the format of name@domain.com"
            },
            password: {
                required: "Password is not empty"
            },
            repassword: {
                equalTo: "Password does not match the confirm password"
            }
        }
    });
});