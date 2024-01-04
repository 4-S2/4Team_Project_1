<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<title>예약 페이지</title>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.0/fullcalendar.min.js"></script>
<script>
$(document).ready(function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        initialDate: new Date(${year}, ${month-1}, ${day}),
        locale: 'ko',
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        dateClick: function(info) {
            // 날짜 클릭 이벤트 처리
            // 예약 상세 페이지로 이동 또는 예약 모달 표시
            alert('Clicked on: ' + info.dateStr);
            // 여기서 예약 상세 정보를 입력하는 로직을 구현
        },
        events: [
            // 여기에 서버에서 가져온 예약 정보를 이벤트로 추가
        ]
    });
    calendar.render();
});
</script>
</head>
<body>

<div id="calendarContainer">
    <div id="calendar"></div>
</div>

</body>
</html>
