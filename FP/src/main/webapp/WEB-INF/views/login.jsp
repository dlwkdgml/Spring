<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
</head>
<body>
   <h1>[로그인]</h1>
   <form name="frm" action="login" method="post">
      <table border=1 >
         <tr>
            <td width=100>아이디</td>
            <td width=300><input type="text" name="id"></td>
         </tr>
         <tr>
            <td>비밀번호</td>
            <td><input type="password" name="pw"></td>
         </tr>
         <tr>
            <td>
               <input type="submit" value="로그인">
               <input type="checkbox" name="chkLogin">로그인 상태유지
            </td>
            <td>
               <a href="/signup"><input type="button" value="회원가입"></a>
            </td>
         </tr>
      </table>
   </form>
</body>
<script>
$(frm).submit(function(e){
   e.preventDefault();
   var pw=$(frm.pw).val();
   var id=$(frm.id).val();
   var chkLogin=$(frm.chkLogin).is(":checked")? true:false;
   $.ajax({
      type:"post",
      url:"login",
      data:{"id":id , "pw":pw, "chkLogin" :chkLogin},
      success:function(data){
            if(data==0){
               alert("아이디가 없습니다.")
            }
            else if(data==2){
               alert("비밀번호가 맞지 않습니다.");
            }else{
               alert("로그인 성공");
               location.href="/";
            }
      }
   });
});
</script>
</html>