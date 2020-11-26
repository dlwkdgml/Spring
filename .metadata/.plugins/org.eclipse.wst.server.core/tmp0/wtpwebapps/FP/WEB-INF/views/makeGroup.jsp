<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>마이페이지</title>
</head>
<body>
	<form name="frm" action="makeGroup" method="post">
		모임 이름<input type="text" name="g_name">
		모임 비밀번호<input type="text" name="g_pass">
		모임 이미지<img src="http://placehold.it/150x120" id="image" width=150> 
	    <input type="file" name="g_pic" value="">
	    <button>완료</button>
	</form>
</body>
<script >
	$(frm.g_pic).on("change",function(){
	    var file=$(frm.g_pic)[0].files[0];
	    $("#image").attr("src",URL.createObjectURL(file));
	 });
</script>
</html>