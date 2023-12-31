<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.h3
{
 color="#2546f3"
}
</style>
<script type="text/javascript">
$(function(){
	$.ajax({
		type:'post',
		url:'../reserve/ex_list.do',
		
		success:function(result)
		{
			$('#ex_list').html(result);
		}
	})
})
</script>
</head>
<body>
  <div >
   <main class="container clear">
   <h2 class="sectiontitle" >전시회 예약</h2>
   <div class="row">
    <table class="table" height=700>
      <tr>
        <td width=20% height="580" class="">
          <table class="table">
           <caption><h3>전시회 정보</h3></caption>
           
             <td>
              <span class="btn btn-xs exs" style="display:none;">전시회</span>
              
             </td>
           
           <tr>
             <td>
              <div id="ex_list" style="height: 450px;overflow-y:scroll"></div>
             </td>
           </tr>
          </table>
        </td>
        <td width=45% height="580" >
         <table class="table">
           <caption><h3>예약일 정보</h3></caption>
           <tr>
            <td id="reserve_day"></td>
           </tr>
           <tr>
        <td width=40% height="120" >
          <table class="table">
           <caption><h3>인원 정보</h3></caption>
           <tr>
             <td id="ex_inwon"></td>
           </tr>
          </table>
        </td>
      </tr>
          </table>
          
        </td>
        <td width=35%  rowspan="2" >
          <table class="table">
           <caption><h3>예약 정보</h3></caption>
           <tr>
             <td colspan="2" class="text-center">
              <img src="noimage.png" style="width: 200px;height: 220px" id="ex_img">
             </td>
           </tr>
           <tr>
             <td colspan="2">
              <span style="color:gray;display:none" id="en">전시회명:</span><span id="ex_ename"></span>
             </td>
           </tr>
           <tr>
             <td colspan="2">
              <span style="color:gray;display:none" id="ed">예약일:</span><span id="ex_day"></span>
             </td>
           </tr>
           <tr>
             <td colspan="2">
              <span style="color:gray;display:none" id="et">예약시간:</span><span id="ex_t"></span>
             </td>
           </tr>
           <tr>
             <td colspan="2">
              <span style="color:gray;display:none" id="ei">예약인원:</span><span id="ex_i"></span>
             </td>
           </tr>
           <%--
               no NUMBER, 제외
			   id VARCHAR2(20), session
			   **fno NUMBER,
			   **rday VARCHAR2(30) CONSTRAINT ri_day_nn NOT NULL,
			   **rtime VARCHAR2(30) CONSTRAINT ri_time_nn NOT NULL,
			   **inwon VARCHAR2(30) CONSTRAINT ri_inwon_nn NOT NULL,
			   rok CHAR(1) DEFAULT 'n',
			   regdate DATE DEFAULT SYSDATE
            --%>
           <tr id="ok" style="display:none">
             <td colspan="2" class="text-center">
              <form method="post" action="../reserve/reserve_ok.do">
                <input type=hidden name="eno" id="r_eno"/>
                <input type=hidden name="rday" id="r_day"/>
                 <input type=hidden name="ename" id="r_ename"/>
                <input type=hidden name="inwon" id="r_inwon"/>
                <input type=hidden name="price" id="r_price"/>
                <input type=hidden name="loc" id="r_loc"/>
                <input type=submit value="예약"
                class="btn btn-lg">
                
              </form>
             </td>
           </tr>
          </table>
        </td>
      </tr>
      
    </table>
   </div>
   </main>
  </div>
</body>
</html>