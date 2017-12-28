
var bindReadmore = function(){
    var readMore = document.querySelector("#read-more")
    var news = {
        'title':"fjsdifjis",
        'src':"images/新垣结衣 (2).jpg",
        'vague': 'fjdsifjosfodsfosjfosjeofeieeeeeeeeeeesvdofjsd',
        'id':4,
    }
    // var t = template(news)

    // readMore.addEventListener("click",function (event) {
    //     var newslist = document.querySelector('#news-content')
    //     console.log(newslist)
    //     console.log("news",news)
    //     console.log("t",template(news))
    //
    //     newslist.insertAdjacentHTML('beforeend', t)
    // })

    readMore.addEventListener("click",function (event) {
        var request = {
            method: 'GET',
            url: '/news/readmore',
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
    var imgSrc = tem.src
    var vague = tem.vague
    var id = tem.id
    var t = `
    <section class="spotlight" id=${id} >
        <div class="image"><img src="${imgSrc}" alt="" height="240" width="200"/></div>
        <div class="content">
            <h3><a href="/news/detail/${id}">${title}</a></h3>
            <p>${vague}</p>
        </div>
    </section>
    `
    return t
}



var main = function(){
    bindReadmore()
}

main()


// var main = function(){
//     var n = 10
//     f(10)
// }
// var f = function(n){
//     if(n < 10){
//         console.log(n)
//     }else {
//         f(n/10)
//         console.log(n % 10)
//     }
// }
