<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<style>
</style>
</head>
<body>
   <h1>[회원가입]</h1>
   <form name ="frm" action="signup" method="post" enctype="multipart/form-data">
   <table border=1 >
         <tr>
            <td>사진</td>
            <td>
               <img src="http://placehold.it/150x120" id="image" name="image" width=150>
               <input type="file" name="pic" >
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
            <td><input type="text" name="keyword"></td>
         </tr>
         <tr>
            <td>이름</td>
            <td><input type="text" name="name"></td>
         </tr>
         <tr>
            <td>생년월일</td>
            <td>
            	<input type='date' name='birthday'/>      
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
            <td><input type="text" name="addrDetail"></td>
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
	
	$(frm.pic).hide();
	
	$("#image").on("click",function(){
	   $(frm.pic).click();
	});
	
	$(frm.pic).on("change",function(){
	   var file=$(frm.pic)[0].files[0];

	   $("#image").attr("src",URL.createObjectURL(file));
	});

  
   
	$(frm).submit(function(){
		alert("버튼");
	});
   
 
   
   $(frm).submit(function(e){
         e.preventDefault();
         var pic=$(frm.pic).val();
         var id=$(frm.id).val();
         var pw=$(frm.pw).val();
         var email=$(frm.email).val();
         var gender=$(frm.gender).val();
         var keyword=$(frm.keyword).val();
         var name=$(frm.name).val();
         var birthday=$(frm.birthday).val();
         var phone=$(frm.phone).val();
         var addr=$(frm.addr).val();
         var addrDetail=$(frm.addrDetail).val();
         alert(pic);
         $.ajax({
            type:"post",
            enctype: 'multipart/formdata',
            url:"signup",
            data:{"pic":pic ,"id":id , "pw":pw,
               "email":email,"gender":gender,"keyword":keyword,
               "name":name,"birthday":birthday,"phone":phone,
               "addr":addr,"addrDetail":addrDetail},
            success:function(data){
                  alert("회원가입 성공");
            }
         });
      });
   
</script>
</html>