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
	let eno=$('#ex_eno').val();
	$('#eno').val(no);
	
	$.ajax({
		type:'post',
		url:'../reserve/diary.do',
		data:{"eno":eno},
		success:function(result)
		{
			$('#ex_date').html(result)
		}
	})
	$.ajax({
		type:'post',
		url:"../reserve/ename.do",
		data:{"eno":eno},
		success:function(result)
		{
			var ename=decodeURIComponent(result);
			$('#ex_ename').text(ename);
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
    <table class="table" height=600px>
      <tr>
        <td width=20% height="580" class="">
          <table class="table">
           <tr>
           <td>
            <img src="${param.poster }" style="width: 300px" id="ex_image">
           </td>
          </tr>
          <tr>
            <td class="td">전시회명&nbsp;:&nbsp;<span id="ex_ename"></span></td>
          </tr>
          <tr>
            <td class="td">예약일&nbsp;:&nbsp;<span id="ex_day"></span></td>
          </tr>  
          <tr>
            <td class="td1">인원&nbsp;:&nbsp;<span id="ex_inwon"></span></td>
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
       <input type="hidden" name="eno" id="eno">
       <input type="hidden" name="rday" id="rday">
       <input type="hidden" name="rinwon" id="rinwon">
       <button class="btn btn-sm btn-res" style="font-size: 14px;width: 100%;height: 40px">예약하기</button>
       </form>
             </td>
           </tr>
            <tr>
      <td width="35%" height="150">
          <table class="table">
           <h3>인원선택</h3>
           <tr>
           <td>
             <div id="inwons"></div>
           </td>
           </tr>
          </table>
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