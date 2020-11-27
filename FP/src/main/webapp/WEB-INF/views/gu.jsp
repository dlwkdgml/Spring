<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>[일정수정]</title>
</head>
<body>
   <form name ="frm" action="guget" method="get" enctype="multipart/form-data">
   <table border=1 >
         <tr>
            <td><input type="hidden" name="id" value="${vo.id}"></td>
         </tr>
         <tr>
            <td >시간</td>
            <td>
                 시작날짜<input type="date" name='sdate' value="2020-01-01" />
                 시작시간:<input type='time' name='stime'/>
            </td>
            <td>
               종료날짜<input type='date' name='edate' value="2020-01-01" min="2020-01-01"/>      
               종료시간:<input type='time' name='etime'/>      
            </td>
         </tr>
         <tr>
            <td>일정이름:</td>
            <td><input type="text" name="cal_title"></td>
         </tr>
         <tr>
            <td>일정분류:</td>
            <td>
               <select name="cal_sdchk">
                  <option>개인일정</option>
                  <option>모임일정</option>
                  <option>1</option>
                  <option>2</option>
                  <option>3</option>
               </select>
            </td>
         </tr>
         <tr>
            <td >컨텐츠:</td>
            <td><input type="text" name="cal_content"></td>
         </tr>
         <tr>
            <td>일정위치</td>
            <td><input type="text" name="cal_place"></td>
         </tr>
         <tr>
            <td>일정공유여부:</td>
            <td>
                 y:<input type="radio" name="cal_schk" value="y">
                  n:<input type="radio" name="cal_schk" value="n">
            </td>
         </tr>
         <tr>
            <td colspan=2>
                 <input type="submit" value="완료"/>
               <a href="/home"><input type="reset" value="취소"></a>
            </td>
         </tr>
      </table>
     </form> 
</body>
<script>
e.preventDefault();
$(frm).submit(function(e){
      var cal_sdate=($(frm.sdate).val()+ " " + $(frm.stime).val());
      var cal_edate=($(frm.edate).val()+ " " + $(frm.etime).val());
      var cal_title=$(frm.cal_title).val();
      var cal_sdchk=$(frm.cal_sdchk).val();
      var cal_content=$(frm.cal_content).val();
      var cal_place=$(frm.cal_place).val();
      var cal_schk=$(frm.cal_schk).val();
      
      
      alert(cal_sdate+cal_edate+cal_title+cal_title
            +cal_sdchk+cal_content+cal_place+
            cal_schk);
      
      $.ajax({
         type:"get",
         url:"/guget",
         data:{"id":id ,"cal_sdate":cal_sdate ,"cal_edate":cal_edate , "cal_title":cal_title,
            "cal_sdchk":cal_sdchk,"cal_content":cal_content,"cal_place":cal_place,
            "cal_schk":cal_schk},
         success:function(data){
               alert("모임만들기 성공");
         }
      });
    
   });

</script>
</html>