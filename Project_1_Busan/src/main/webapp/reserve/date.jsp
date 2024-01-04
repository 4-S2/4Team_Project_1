<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>예약 날짜 선택</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td {
            padding: 5px;
            text-align: center;
        }
        th {
            background-color: #f0f0f0;
        }
        .day {
            cursor: pointer;
        }
        .selected {
            background-color: #add8e6;
        }
    </style>
    <script>
        function createCalendar(year, month) {
            var daysInMonth = new Date(year, month, 0).getDate();
            var firstDay = new Date(year, month - 1, 1).getDay();
            var calendar = document.getElementById('calendar');
            calendar.innerHTML = '';

            var date = 1;
            for (var i = 0; i < 6; i++) {
                var row = document.createElement('tr');
                for (var j = 0; j < 7; j++) {
                    var cell = document.createElement('td');
                    if (i === 0 && j < firstDay) {
                        cell.innerHTML = '';
                    } else if (date > daysInMonth) {
                        break;
                    } else {
                        cell.innerHTML = date;
                        cell.classList.add('day');
                        cell.onclick = function() { selectDate(this); };
                        date++;
                    }
                    row.appendChild(cell);
                }
                calendar.appendChild(row);
            }
        }

        function selectDate(cell) {
            var selected = document.getElementsByClassName('selected');
            if (selected.length > 0) {
                selected[0].className = 'day';
            }
            cell.className = 'selected';
        }

        window.onload = function() {
            var today = new Date();
            createCalendar(today.getFullYear(), today.getMonth() + 1);
        };
    </script>
</head>
<body>
    <h2>예약 날짜 선택</h2>
    <table id="calendar"></table>
</body>
</html>
