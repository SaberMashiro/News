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

var comment = {
    submit: function() {
        var guestname = document.getElementById('two_guestname').value;
        var content = document.getElementById('two_content').value;
        var data = new FormData();
        data.append('newsId', location.pathname.split('/')[2]);
        data.append('guestname', guestname);
        data.append('content', content);
        var request = {
            method: 'POST',
            url: '/comment',
            data: data
        };
        ajax(request);
    },
    load: function(count) {
        var data = new FormData();
        data.append('newsId', location.pathname.split('/')[2]);
        data.append('count', count);
        var request = {
            method: 'POST',
            url: '/comment',
            data: data,
            callback: function(object) {
                var comments = document.getElementById('three_comments');
                for (var record of object) {
                    var div = document.createElement('div');
                    var p = document.createElement('p');
                    p.textContent = record.content;
                    div.appendChild(p);
                    var h6 = document.createElement('h6');
                    h6.textContent = record.guestname + ', ' + record.time;
                    div.appendChild(h6);
                    div.style.paddingBottom = "2em";
                    comments.appendChild(div);
                }
            }
        }
        ajax(request);
    }
};

var submit = document.getElementById('two_submit');
submit.onclick = function() {
    comment.submit();
};

var more = document.getElementById('three_more');
more.onclick = function() {
    comment.load(page++);
};

var page = 0;
comment.load(page++);