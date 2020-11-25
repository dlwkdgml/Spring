<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
#birthday{width:60px;}
</style>
</head>
<body>
   <h1>[회원가입]</h1>
   <form name ="frm" action="insert" method="post" enctype="multipart/form-data">
   <table border=1 >
         <tr>
            <td>사진</td>
            <td>
               <img src="http://placehold.it/150x120" id="image" width=150>
               <input type="file" name="file">
            </td>
         </tr>
         <tr>
            <td width=60>아이디</td>
            <td width=650><input type="text" name="id"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw"></td>
         </tr>
         <tr>
            <td>이메일</td>
            <td><input type="text" name="email"></td>
         </tr>
         <tr>
            <td>성별</td>
            <td>
               남:<input type="radio" name="gender" value="m">
               여:<input type="radio" name="gender" value="f">
            </td>
         </tr>
         <tr>
            <td>관심 키워드</td>
            <td>
               <select name="keyword1">
                  <option value="게임">게임</option>
                  <option value="운동">운동</option>
                  <option value="낚시">낚시</option>
                  <option value="자동차">자동차</option>
               </select>
               <select name="keyword2">
                  <option value="게임">게임</option>
                  <option value="운동">운동</option>
                  <option value="낚시">낚시</option>
                  <option value="자동차">자동차</option>
               </select>
               <select name="keyword3">
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
            <td>
               <input type="text" name="birthday" maxlength="6">:주민번호 앞자리       
            </td>
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
            <td colspan=2>
               <input type="submit" value="가입">
               <a href="/login"><input type="reset" value="취소"></a>
            </td>
         </tr>
      </table>
     </form> 
</body>
<script>
	$(frm.file).hide();
	
	$("#image").on("click",function(){
		$(frm.file).click();
	});

	$(frm.file).on("change",function(){
		var file=$(frm.file)[0].files[0];
		$("#image").attr("src",URL.createObjectURL(file));
	});
</script>
</html>