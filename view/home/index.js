
var bindReadmore = function(){
    var readMore = document.querySelector("#read-more")
    readMore.addEventListener("click",function (event) {
        var request = {
            method: 'GET',
            url: '/title/'+count++,
            contentType: 'application/json',
            callback: function(response) {
                // 不考虑错误情况(断网/服务器返回错误等等)
                console.log('响应', response)
                var news = JSON.parse(response)
                var newslist = document.querySelector('#news-content')
                for(var i = 0; i < news.length;i++){
                    var t = template(news[i])
                    newslist.insertAdjacentHTML('beforeend', t)
                }
            }
        }
        ajax(request)
    })
}

var ajax = function(request) {
    var r = new XMLHttpRequest()
    r.open(request.method, request.url, true)
    if (request.contentType !== undefined) {
        r.setRequestHeader('Content-Type', request.contentType)
    }
    r.onreadystatechange = function(event) {
        if(r.readyState === 4) {
            request.callback(r.response)
        }
    }
    if (request.method === 'GET') {
        r.send()
    } else {
        r.send(request.data)
    }
}

var template = function(tem){
    var title = tem.title
    var imgSrc = tem.icon
    var vague = tem.synopsis
    var id = tem.news_id
    var t = `
    <section class="spotlight" id=${id} >
        <div class="image"><img src="${imgSrc}" alt="" height="240" width="200"/></div>
        <div class="content">
            <h3><a href="/detail/${id}#news_body">${title}</a></h3>
            <p>${vague}</p>
        </div>
    </section>
    `
    return t
}



var main = function(){
	count = 0
	var request = {
            method: 'GET',
            url: '/title/'+count++,
            contentType: 'application/json',
            callback: function(response) {
                // 不考虑错误情况(断网/服务器返回错误等等)
                console.log('响应', response)
                var news = JSON.parse(response)
                var newslist = document.querySelector('#news-content')
                for(var i = 0; i < news.length;i++){
                    var t = template(news[i])
                    newslist.insertAdjacentHTML('beforeend', t)
                }
            }
        }
	ajax(request)
	bindReadmore()
}

main()
