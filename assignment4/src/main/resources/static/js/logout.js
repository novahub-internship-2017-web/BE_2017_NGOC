$("#btn-logout").click(function (event) {
   event.preventDefault();

   callLogoutAPI();
});

function callLogoutAPI(){

    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: window.location.origin + "/api/logout",
        dataType: 'json',
        timeout: 10000,
        success: function (dataReceive) {
            window.location.replace(window.location.origin + "/login");
        },
        error: function (e) {
            console.log("ERROR : ", e.responseJSON.message);
        }
    });
}      