<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지역검색</title>
</head>
<body>
   <h1>[지역검색]</h1>
   <div id="divSearch">
      <button id="btnSave">선택저장</button>
      <input id="query" value="버거킹"> <input type="button"
         value=" 검색 " id="btnSearch"> <span id="total"></span>
   </div>
   <table id="tbl" border=1></table>
   <script id="temp" type="text/x-handlebars-template">
         <tr class="title">
         <td width=20><input type="checkbox" id="chkAll"></td>
         <td width=150>장소명</td>
         <td width=150>전화번호</td>
         <td width=300>주소</td>         
      </tr>
      {{#each documents}}
      <tr class="row">
         <td><input type="checkbox" class="chk" id={{id}} place_name="{{place_name}}" address_name="{{address_name}}" phone="{{phone}}" x={{x}} y={{y}}></td>
         <td>{{place_name}}</td>
         <td>{{phone}}</td>
         <td>{{address_name}}</td>
      </tr>
      {{/each}}
      </script>
   <div id="pagination">
      <button id="btnPre">이전</button>
      <button id="btnNext">다음</button>
   </div>
</body>
<script>
   getList();
   var page = 1;

   $("#btnSave").on("click", function() {
      if (!confirm("선택한 내용을 저장하실래요?"))
         return;
      $("#tbl .row .chk:checked").each(function() {
         var id = $(this).attr("id");
         var place_name = $(this).attr("place_name");
         var address_name = $(this).attr("address_name");
         var phone = $(this).attr("phone");
         var x = $(this).attr("x");
         var y = $(this).attr("y");
         $.ajax({
            type : "post",
            url : "insert",
            data : {"id" : id,"place_name" : place_name,"address_name" : address_name,"phone" : phone,"x" : x,"y" : y},
            success : function() {
            }
         });
      });
      $("#tbl .row .chk").each(function() {
         $(this).prop("checked", false);
      });
      $("#tbl #chkAll").prop("checked", false);
      alert("저장성공");
   });

   $("#tbl").on("click", "#chkAll", function() {
      if ($(this).is(":checked")) {
         $("#tbl .row .chk").each(function() {
            $(this).prop("checked", true);
         });
      } else {
         $("#tbl .row .chk").each(function() {
            $(this).prop("checked", false);
         });
      }
   });

   //각 행의 체크박스를 클릭한 경우
   $("#tbl").on("click", ".row .chk", function() {
      var isCheck = true
      $("#tbl .row .chk").each(function() {
         if (!$(this).is(":checked"))
            isCheck = false
      });
      if (isCheck) {
         $("#chkAll").prop("checked", true);
      } else {
         $("#chkAll").prop("checked", false);
      }
   });

   $("#btnNext").on("click", function() {
      page++;
      getList();
   });

   $("#btnPre").on("click", function() {
      page--;
      getList();
   });

   $("#btnSearch").on("click", function() {
      getList();
   });

   $("#query").keydown(function(key) {
      if (key.keyCode == 13) {
         getList();
      }
   });

   function getList() {
      var query = $("#query").val();
      $.ajax({
         type : "get",
         url : "https://dapi.kakao.com/v2/local/search/keyword.json",
         headers : {
            "Authorization" : "KakaoAK 4c9947b8b0448265ca15036c39a7fa4e"
         },
         data : {
            "query" : query,
            "page" : page,
            "size" : 10
         },
         dataType : "json",
         success : function(data) {
            var temp = Handlebars.compile($("#temp").html());
            $("#tbl").html(temp(data));
            var total = data.meta.pageable_count;
            $("#total").html(total + " 건");
            if (page == 1) {
               $("#btnPre").attr("disabled", true);
            } else {
               $("#btnPre").attr("disabled", false);
            }
            if (data.meta.is_end) {
               $("#btnNext").attr("disabled", true);
            } else {
               $("#btnNext").attr("disabled", false);
            }
         }
      });
   }
</script>



</html>