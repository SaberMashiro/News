
      
    $(document).ready(function() {
    (function() {
        showcontent1("category");
		showcontent("news");
		showcontent2("category_news");
        choosenewstype();
    })();
	var code="";
  function choosenewstype() {
        $(".text-content-list tr").each(function() {
            $(this).click(function() {
				var type = $(this).children("td").attr("name");
                var text = $(this).text();
                $(this).css("background", "cadetblue").siblings().css("background", "darkcyan");
                $(".news-title h2 span").text(text);

				$(".news-update").hide();
				$(".news-update1").hide();
				$(".news-update2").hide();
				switch(type){
					case news :
				      showcontent(type);  
					  break;
					case category :
				       showcontent1(type);  
					   break;
					case category_news :
				      showcontent2(type);  
					  break;
				}
				
            });

        });
    }
  $("#category").click(function() {
            $(".hidden").html("");
            $(".news-content-list1").show();
            $(".news-content-list").hide();
			$(".news-content-list2").hide();
            
        });
		$("#news").click(function() {
            $(".hidden").html("");
            $(".news-content-list").show();
            $(".news-content-list1").hide();
			$(".news-content-list2").hide();
            
        });
		$("#category_news").click(function() {
            $(".hidden").html("");
            $(".news-content-list2").show();
			$(".news-content-list").hide();
            $(".news-content-list1").hide();
            
        });
		function showcontent(tablename) {
        $.ajax({
            type: "post",
            url: "select",
            data: {
                tablename: tablename
            },
            dataType: "json",
			
            success: function(data) {
				console.log(data);
                $("#news-content").html("");
                $.each(data, function(index, value) {
                    var news_id = value.news_id;   
					$("#news-content").append("<tr>");
                        $("#news-content").append("<td>"+value.news_id + "</td>");  
                        $("<td>"+ value.title +"</td>").appendTo("#news-content");
                        $("<td>"+ value.icon +"</td>").appendTo("#news-content");
						$("<td>"+ value.synopsis +"</td>").appendTo("#news-content");
						$("<td>"+ value.content +"</td>").appendTo("#news-content");
						$("<td>"+ value.time +"</td>").appendTo("#news-content");
					var button = $("<td>").appendTo("#news-content");
					$("#news-content").append("</tr>");
                    // 点击修改按钮
                    $("<a>").appendTo(button).text("修改").addClass("modify").click(function() {
                        
                            
                                // 显示旧信息
                                $("#goback").css("display","block");
                                $(".news-update").show();
                                $(".news-content-list").hide();
								$("#news_id").val(value.news_id);
                                $("#title").val(value.title);
								$("#icon").val(value.icon);
								$("#username").val(value.username);
                                $("#synopsis").val(value.synopsis);
                                $("#content").val(value.content);
                                
                                var parent = $("#content").parent("p");
                                $("<input type='text'>").appendTo(parent).addClass("hide").val(news_id);
                                code = 2;
                        
                    });
                    // 删除新闻
                    $("<a>").appendTo(button).text("删除").addClass("delete").click(function() {
                        $.ajax({
                            type: "POST",
                            url: 'delete',
                            data: {
                                news_id: news_id,
								tablename:tablename
                            },
                            success: function(data) {
                                alert("删除成功");
                            }
                        });
                    });
                });
            }
        });
        //点击添加按钮
        $("#add").click(function() {
            $(".hidden").html("");
            $("#title").focus();
            $(".news-update").show();
            $(".news-content-list").hide();
            $("#goback").css("display","block");
            $("#title").val();
			
			$("#icon").val();
            $("#synopsis").val();
            $("#content").val();
           
            $("#usernmae").val();
            code = 1;
        });
    }
	 $("#goback").click(function() {
        $(".news-update").hide();
        $(".news-content-list").show();
        $("#goback").css("display","none");
    });
	 // 添加新闻
    $("#submit").click(function() {
        // 判断关键信息是否为空
        if ($("#title").val() == "" ||  $("#icon").val() == ""|| $("#content").val() == "") {
            alert("请完善新闻信息！");
        } else {
            if (code == 1) {console.log("test");
                $.ajax({
					
                    url: 'add/news',
                    type: "POST",
                    dataType: "json",
                    data: {
                        
                        title: $("#title").val(),
                        content: $("#content").val(),
                        icon: $("#icon").val(),
                        username: $("#username").val(),
                        synopsis: $("#synopsis").val(),
                       
                    },
                    success: function(data) {
						console.log(data); 
                        alert("添加成功");
                        $(".news-update").hide();
                        $(".news-content-list").show();
                    }
                });
            } else if (code == 2) {
                $.ajax({
                    type: "POST",
                    url: 'update/news',
                    data: {
						
                        news_id: $(".hide").val(),
                        title: $("#title").val(),
                        content: $("#content").val(),
                        icon: $("#icon").val(),
                        username: $("#username").val(),
                        synopsis: $("#synopsis").val(),
                        
                    },
                    success: function(data) {
                        alert('修改成功');
                        $(".news-update").hide();
                        $(".news-content-list").show();
                    }
                });
            }
        }
    });	
			
			
			
			function showcontent1(tablename) {
        $.ajax({
            type: "post",
            url: "select",
            data: {
                tablename: tablename
            },
            dataType: "json",
			
            success: function(data) {
				
                $("#news-content1").html("");
                $.each(data, function(index, value) {
                    
					$("#news-content1").append("<tr>");
                        $("#news-content1").append("<td>"+value.category_id + "</td>");  
                        $("<td>"+ value.name +"</td>").appendTo("#news-content1");
               
					var button = $("<td>").appendTo("#news-content1");
					$("#news-content1").append("</tr>");
                    // 点击修改按钮
                    $("<a>").appendTo(button).text("修改").addClass("modify").click(function() {
                        
                            
                                // 显示旧信息
                                $("#goback").css("display","block");
                                $(".news-update1").show();
                                $(".news-content-list1").hide();
								$("#category_id").val(value.category_id);
                                $("#name").val(value.name);
								
                                code = 2;
                        
                    });
                    // 删除新闻
                    $("<a>").appendTo(button).text("删除").addClass("delete").click(function() {
                        $.ajax({
                            type: "POST",
                            url: 'delete',
                            data: {
                                category_id: category_id,
								tablename:tablename
                            },
                            success: function(data) {
                                alert("删除成功");
                            }
                        });
                    });
                });
            }
        });
        //点击添加按钮
        $("#add1").click(function() {
            $(".hidden").html("");
           
            $(".news-update1").show();
            $(".news-content-list1").hide();
            $("#goback1").css("display","block");
            $("#category_id").val();
			
			$("#name").val();
           
            code = 1;
        });
    }
	 $("#goback1").click(function() {
        $(".news-update1").hide();
        $(".news-content-list1").show();
        $("#goback1").css("display","none");
    });
	 // 添加新闻
    $("#submit1").click(function() {
        // 判断关键信息是否为空
        if ($("#category_id").val() == ""|| $("#name").val() == "") {
            alert("请完善新闻信息！");
        } else {
            if (code == 1) {
                $.ajax({
					
                    url: 'add/category',
                    type: "POST",
                    dataType: "json",
                    data: {
                        
                        catelog_id: $("#category_id").val(),
                        name: $("#name").val(),
                        
                       
                    },
                    success: function(data) {
						console.log(data); 
                        alert("添加成功");
                        $(".news-update1").hide();
                        $(".news-content-list1").show();
                    }
                });
            } else if (code == 2) {
                $.ajax({
                    type: "POST",
                    url: 'update/category',
                    data: {
						
                        catelog_id: $("category_id").val(),
                        name: $("#name").val(),
                        
                        
                    },
                    success: function(data) {
                        alert('修改成功');
                        $(".news-update1").hide();
                        $(".news-content-list1").show();
                    }
                });
            }
        }
    });	
	
			function showcontent2(tablename) {
        $.ajax({
            type: "post",
            url: "select",
            data: {
                tablename: tablename
            },
            dataType: "json",
			
            success: function(data) {
				console.log(data);
                $("#news-content2").html("");
                $.each(data, function(index, value) {
                      
					$("#news-content2").append("<tr>");
                        $("#news-content2").append("<td>"+value.category_id + "</td>");  
                        $("<td>"+ value.news_id +"</td>").appendTo("#news-content2");
               
					var button = $("<td>").appendTo("#news-content2");
					$("#news-content2").append("</tr>");
                    // 点击修改按钮
                    $("<a>").appendTo(button).text("修改").addClass("modify").click(function() {
                        
                            
                                // 显示旧信息
                                $("#goback2").css("display","block");
                                $(".news-update2").show();
                                $(".news-content-list2").hide();
								$("#category_id").val(value.category_id);
                                $("#news_id").val(value.news_id);
								
                                code = 2;
                        
                    });
                    // 删除新闻
                    $("<a>").appendTo(button).text("删除").addClass("delete").click(function() {
                        $.ajax({
                            type: "POST",
                            url: 'delete',
                            data: {
                                category_id: category_id,
								tablename:tablename
                            },
                            success: function(data) {
                                alert("删除成功");
                            }
                        });
                    });
                });
            }
        });
        //点击添加按钮
        $("#add2").click(function() {
            $(".hidden").html("");
           
            $(".news-update2").show();
            $(".news-content-list2").hide();
            $("#goback2").css("display","block");
            $("#category_id").val();
			
			$("#news_id").val();
           
            code = 1;
        });
    }
	 $("#goback2").click(function() {
        $(".news-update2").hide();
        $(".news-content-list2").show();
        $("#goback2").css("display","none");
    });
	 // 添加新闻
    $("#submit2").click(function() {
        // 判断关键信息是否为空
        if ($("#category_id").val() == ""|| $("#news_id").val() == "") {
            alert("请完善新闻信息！");
        } else {
            if (code == 1) {
                $.ajax({
					
                    url: 'add/category_news',
                    type: "POST",
                    dataType: "json",
                    data: {
                        
                        category_id: $("#category_id").val(),
                        news_id: $("#news_id").val(),
                        
                       
                    },
                    success: function(data) {
						console.log(data); 
                        alert("添加成功");
                        $(".news-update2").hide();
                        $(".news-content-list2").show();
                    }
                });
            } else if (code == 2) {
                $.ajax({
                    type: "POST",
                    url: 'update/category_news',
                    data: {
						
                        category_id: $("#category_id").val(),
                        news_id: $("#news_id").val(),
                        
                        
                    },
                    success: function(data) {
                        alert('修改成功');
                        $(".news-update2").hide();
                        $(".news-content-list2").show();
                    }
                });
            }
        }
    });	
	
	
});
