<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>도서검색</title>
</head>
<body>
	<h1>[도서검색]</h1>
	<div id="divSearch">
		<input type="text" id="query" value="데카르트">
		<button id="btnSave">저장</button>
	</div>

	<div id="divBook"></div>
	<script id="template" type="text/x-handlebars-template">
   {{#each items}}
      <div class="box" id="{{isbn}}" title="{{{title}}}" price="{{price}}" image="{{image}}">
         <img src="{{image}}" width=150>
         <div>{{{title}}}</div>
         <div>{{price}}원</div>
      </div>
   {{/each}}
   </script>
</body>
<script>
	var page = 1;
	getList();

	$("#btnSave").on("click", function() {
		if (!confirm("저장"))
			return;
		$("#divBook .box").each(function() {
			var id = $(this).attr("id");
			var title = $(this).attr("title");
			var price = $(this).attr("price");
			var fullImage = $(this).attr("image");

			var image = fullImage.split("?")[0].split("/")[6];

			$.ajax({
				type : "post",
				url : "insert",
				data : {
					"id" : id,
					"title" : title,
					"price" : price,
					"image" : image,
					"fullImage":fullImage
				},
				success:function(){
				}
			});
		});
		alert("저장");
	});

	$("#query").keydown(function(key) {
		if (key.keyCode == 13) {
			getList();
		}
	});

	function getList() {
		var query = "칸트";

		$.ajax({
			type : "get",
			url : "book.json",
			data : {
				"query" : query
			},
			dataType : "json",
			success : function(data) {
				var template = Handlebars.compile($("#template").html());
				$("#divBook").html(template(data));
			}
		});
	}
</script>
</html>
