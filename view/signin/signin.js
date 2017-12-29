var ajax = function(request) {
    var xhr = new XMLHttpRequest();
    xhr.onload = function() {
        if (request.callback != undefined) {
            var object = JSON.parse(this.responseText);
            request.callback(object);
        }
    }
    xhr.open(request.method, request.url, true);
    if (request.method == 'GET') {
        xhr.send();
    }
    if (request.method = 'POST') {
        xhr.send(request.data);
    }
}

var verify = function() {
    var username = document.querySelector("#id-input-user").value
    var password = document.querySelector("#id-input-pwd").value
    var form = {
        'username':username,
        'password':password,
    }
    var data = JSON.stringify(form)
    var request = {
        method: 'POST',
        url: '/verify',
        data: data,
        callback: function(result) {
            if (result.verified) {
                window.location.href = result.location
            }
        }
    }
    ajax(request)
}

var button = document.querySelector(".btn");
button.addEventListener("click", verify());
var password = document.getElementById("id-input-pwd");
password.onkeypress = function(event) {
    if (event.keyCode == 13) {
        verify();
    }
}