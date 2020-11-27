<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<title>멤버 추가 하기</title>
</head>
<body>
	<input type="text" id="query">
	<button id="search">검색</button>
	<hr>
	<h1>검색 결과</h1>
	<div id="result"></div>
	<script id="temp" type="text/x-handlebars-template">
		{{#each .}}
		<div>
			<input type="checkbox" value="{{id}}" name="selectedMember">			
			이름 : {{name}} 
			아이디 : {{id}} 
      	</div>	
		{{/each}}
	</script>
	<input type="button" id="complete" value="완료">
</body>
<script >
	$("#search").on("click",function(){
		var query = $("#query").val();
		alert(query);
		$.ajax({
			type :"get",
		    url : "searchGroupMember",
			dataType : "json",
		    data : {"query" : query},
		    success : function(data){
		    	var temp = Handlebars.compile($("#temp").html());
	            $("#result").html(temp(data));
		    }
		});
	})
	
	$("#complete").on("click",function(){
      
      var g_code = 21; // session에서 g_code를 가져온다.
      var gu_pwchk= "N";
      var check_count = document.getElementsByName("selectedMember").length;
      for(var i=0; i<check_count; i++){
         if (document.getElementsByName("selectedMember")[i].checked == true) {
            //alert(document.getElementsByName("selectedMember")[i].value);
            // 친구 초대하는 ajax 실행하면 됨
            
            var id=document.getElementsByName("selectedMember")[i].value;
            alert(id);
            
            $.ajax({
               type :"get",
                url : "addMembers",
                data : {"g_code" : g_code, "gu_pwchk" :gu_pwchk,"id":id},
                success : function(){
                }
            });
         }
      }
	});
	
	
</script>
</html>