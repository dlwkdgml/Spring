<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>동아리등록</title>
<style>
ul li.tag-item {
   padding: 4px 8px;
   background-color: #777;
   color: #000;
}

.tag-item:hover {
   background-color: #262626;
   color: #fff;
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
            <td>
               <div class="content">
                  <form action="insert" method="POST" id="tag-form">
                     <input type="hidden" value="" name="tag" id="rdTag" />
                     <button onclick="btnHash">태그등록</button>
                  </form>
                  <div>
                     <input type="text" id="C_TAG" size="7" placeholder="태크엔터!" />
                  </div>
                  <ul id="tag-list">
                  </ul>
               </div>
            </td>
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
      <input type="submit" value="저장"> <input type="reset" value="취소">
   </form>
</body>

<script>
   //해쉬태그작동, 서버에 옮기기
   $(document)
         .ready(
               function() {
                  var C_TAG = {};
                  var counter = 0;
                  // 태그를 추가한다.
                  function addTag(value) {
                     C_TAG[counter] = value; // 태그를 Object 안에 추가
                     counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
                  }
                  // 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
                  function marginTag() {
                     return Object.values(C_TAG).filter(function(word) {
                        return word !== "";
                     });
                  }
                  // 서버에 넘기기
                  function btnHash() {
                     var value = marginTag(); // return array
                     $("#rdTag").val(value);

                     $(this).submit();
                  }

                  $("#C_TAG")
                        .on( "keypress",
                              function(e) {
                                 var self = $(this);
                                 // input 에 focus 되있을 때 엔터 및 스페이스바 입력시 구동
                                 if (e.key === "Enter"
                                       || e.keyCode == 32) {
                                    var tagValue = self.val(); // 값 가져오기
                                    
                                    // 값이 없으면 동작 ㄴㄴ
                                    if (tagValue !== "") {

                                       // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                                       var result = Object
                                             .values(C_TAG)
                                             .filter(
                                                   function(
                                                         word) {
                                                      return word === tagValue;
                                                   })

                                       // 태그 중복 검사
                                       if (result.length == 0) {
                                          $("#tag-list")
                                                .append(
                                                      "<li class='tag-item'>"
                                                            + tagValue
                                                            + "<span class='del-btn' idx='"+counter+"'>x</span></li>");
                                          addTag(tagValue);
                                          self.val("");
                                       } else {
                                          alert("태그값이 중복됩니다.");
                                       }
                                    }
                                    e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
                                 }
                              });

                  // 삭제 버튼은 비동기적 생성이므로 document 최초 생성시가 아닌 검색을 통해 이벤트를 구현시킨다.
                  $(document).on("click", ".del-btn", function(e) {
                     var index = $(this).attr("idx");
                     C_TAG[index] = "";
                     $(this).parent().remove();
                  });
               });

   
   
   //서밋했을때
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

      alert(C_NAME + "\n" + C_TAG + "\n" + C_CONDITION + "\n" + C_CATEGORY + "\n" + C_PCHK + "\n" + C_WELCOME + "\n" + C_PIC + "\n" + C_SPOT);
      $.ajax({
         type : "post",
         url : "insert",
         data : {
            "c_name" : C_NAME,
            "c_pchk" : C_PCHK,
            "c_welcome" : C_WELCOME,
            "c_condition" : C_CONDITION,
            "c_category" : C_CATEGORY,
            "c_tag" : C_TAG,
            "c_pic" : C_PIC,
            "c_spot" : C_SPOT
         },
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

   $(frm.C_PIC).on("change", function() {
      var file = $(frm.C_PIC)[0].files[0];
      $("#image").attr("src", URL.createObjectURL(file));
   });
</script>

</html>
