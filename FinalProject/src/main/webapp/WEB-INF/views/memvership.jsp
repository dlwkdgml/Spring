<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>[회원가입]</h1>
	<table border=1 >
			<tr>
				<td width=100>아이디</td>
				<td width=300><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="upw"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="Email"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><input type="radio" class="gender">남:</td>
				<td><input type="radio" class="gender">여:</td>
			</tr>
			<tr>
				<td>관심 키워드</td>
				<td>
					<select>
						<option value="게임">게임</option>
						<option value="운동">운동</option>
						<option value="낚시">낚시</option>
						<option value="자동차">자동차</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="text" name="birthday"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td><input type="text" name="addrditail"></td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="로그인">
				</td>
				<td>
					<a href="memvership"><input type="button" value="회원가입"></a>
				</td>
			</tr>
		</table>
</body>
</html>