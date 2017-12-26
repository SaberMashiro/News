var log = console.log.bind(console)

var request = {
    method: 'POST',
    url: '/api/comment/add',
    data: data,
    contentType: 'application/json',
    callback: function(response) {
        console.log('响应', response)
        var res = JSON.parse(response)
        callback(res)
}

var ajax = function(request) {
    /*
     request 是一个 object，有如下属性
     method，请求的方法，string
     url，请求的路径，string
     data，请求发送的数据，如果是 GET 方法则没有这个值，string
     callback，响应回调，function
     */
    var r = new XMLHttpRequest()
    r.open(request.method, request.url, true)
    if (request.contentType != undefined) {
        r.setRequestHeader('Content-Type', request.contentType)
    }
    r.onreadystatechange = function() {
        if (r.readyState == 4) {
            request.callback(r.response)
        }
    }
    if (request.method == 'GET') {
        r.send()
    } else {
        r.send(request.data)
    }
}


var Button = document.querySelector(".btn")
Button.addEventListener("click",function (event) {
    var username = document.querySelector("#id-input-user").value
    var password = document.querySelector("#id-input-pwd").value
    var form = {
        'username':username,
        'password':password,
    }
    var data = JSON.stringify(form)
    var request = {
        method: 'POST',
        url: '/loginCheck',
        data: data,
        contentType: 'application/json',
        callback: function(response) {
            console.log('响应', response)
            var res = JSON.parse(response)
            callback(res)
        }
    }
    ajax(request)
})

var loginRequest = function(request){

}
var request = {
    method: 'POST',
    url: '/login',
    contentType: 'application/json',
    callback: function(response) {
        // 不考虑错误情况（断网、服务器返回错误等等）
        console.log('响应', response)
    }
}

ajax(request)
