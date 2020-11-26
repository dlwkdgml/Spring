<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리등록</title>
<style>
span.hashtag {
   color: blue;
}
</style>
</head>
<body>
   <h1>동아리~~~~~~~~개설~~~</h1>
   <form action="insert" method="post" name="frm">
      <table border=1>
         <tr>
            <td width=150>동아리이름</td>
            <td width=500><input type="text" name="C_NAME"></td>
         </tr>
         <tr>
            <td width=150>연락처공개여부</td>
            <td width=500>예 <input type="radio" name="C_PCHK" value="YInfo"
               checked="checked"> 아니오<input type="radio" name="C_PCHK"
               value="NInfo"></td>
         </tr>
         <tr>
            <td width=150>카테고리</td>
            <td width=500><select name="C_CATEGORY" value="관심사">
                  <option value="게임">게임</option>
                  <option value="운동">운동</option>
                  <option value="낚시">낚시</option>
                  <option value="자동차">자동차</option>
            </select></td>
         </tr>
         <tr>
            <td width=150>태그</td>
            <td width=500><input type="text" name="C_TAG"
               placeholder="#해쉬 #태그"></td>
         </tr>
         <tr>
            <td width=150>인삿말</td>
            <td width=500><input type="text" name="C_WELCOME"
               placeholder="환영의인사를해주세요"></td>
         </tr>
         <tr>
            <td width=150>가입조건</td>
            <td width=500><textarea rows="10" cols="50" name="C_CONDITION">
            </textarea></td>
         </tr>
         <tr>
            <td width=150>대표사진</td>
            <td width=500><img src="http://placehold.it/150x120" id="image"
               width=150> <input type="file" name="C_PIC"></td>
         </tr>
         <tr>
            <td width=150>활동장소</td>
            <td width=500><input type="text" name="C_SPOT"
               placeholder="어디서활동하세요?"></td>
         </tr>


      </table>
      <input type="submit" value="저장"> <input type="reset"
         value="취소">
      <!-- 
<script type="text/javascript">
         var content = document.getElementById('C_TAG').innerHTML;
         var splitedArray = content.split(' ');
         var linkedContent = '';
         for ( var word in splitedArray) {
            word = splitedArray[word];
            if (word.indexOf('#') == 0) {

               word = '<a href=\'링크\'>' + word + '</a>';
            }
            linkedContent += word + ' ';
         }
         document.getElementById('C_TAG').innerHTML = linkedContent;
      </script>
 -->

   </form>
</body>

<script>
   $(frm).submit(function(e) {
      e.preventDefault();
      var C_NAME = $(frm.C_NAME).val();
      var C_PCHK = $(frm.C_PCHK).val();
      var C_WELCOME = $(frm.C_WELCOME).val();
      var C_CONDITION = $(frm.C_CONDITION).val();
      var C_CATEGORY = $(frm.C_CATEGORY).val();
      var C_TAG = $(frm.C_TAG).val();
      var C_PIC = $(frm.C_PIC).val();
      var C_SPOT = $(frm.C_SPOT).val();

      alert(C_NAME);
      $.ajax({
         type : 'post',
         url : 'insert',
         data : {
            "C_NAME" : C_NAME,
            "C_PCHK":C_PCHK,
            "C_WELCOME":C_WELCOME,
            "C_CONDITION":C_CONDITION,
            "C_CATEGORY":C_CATEGORY,
            "C_TAG":C_TAG,
            "C_PIC":C_PIC,
            "C_SPOT":C_SPOT
         },
         dataType : 'json',
         success : function(data) {
            if ($(frm.C_NAME).val() == "") {
               alert("동아리이름");
               $(frm.C_NAME).focus();
            } else if ($(frm.C_TAG).val() == "") {
               alert("해쉬태그설정해주세요");
               $(frm.C_TAG).focus();
            } else {
               if (!confirm("글등록?"))
                  return;
               frm.submit();
            }
            alert("성공");
         }
      });
   });
   
   $(frm.C_PIC).on("change",function(){
       var file=$(frm.C_PIC)[0].files[0];
       $("#image").attr("src",URL.createObjectURL(file));
    });
</script>

</html>