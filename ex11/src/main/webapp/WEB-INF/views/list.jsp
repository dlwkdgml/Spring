<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저목록</title>
</head>
<body>
	<h1>[유저목록]</h1>
	<a href="insert">[유저 등록]</a>
	
	<c:if test="${uid == null}">
	<button onClick="location.href='login'">로그인</button>
	</c:if>
	
	<c:if test="${uid != null}">
	<button onClick="location.href='logout'">로그아웃</button>
	<span>${uid}님 입장</span>
	</c:if>
	
	<table border=1>
		<tr>
			<td width=100>아이디</td>
			<td width=100>이름</td>
		</tr>
		<c:forEach items="${list}" var="vo">
			<tr>
				<td width=100><a href="read?uid=${vo.uid}">${vo.uid}</a></td>
				<td width=100>${vo.uname}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>