<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>밤낮</title>
<link rel="shortcut icon" type="image/x-icon" href="<%= request.getContextPath() %>/layout/images/logo.jpg">
<meta charset='utf-8' />
<link href="<%= request.getContextPath() %>/calendar/lib/main.css" type="text/css" rel="stylesheet">
<script src="<%= request.getContextPath() %>/calendar/lib/main.js"></script>
<script>

  var day = []
  var sleep_time = []
  var counter = 0
    window.onload = function(){
        
        const modal = document.getElementById("modal")
        const closeBtn = modal.querySelector(".close-area")

        closeBtn.addEventListener("click", e => {
            modal.style.display = "none"
        })
        
        function modalOn() {

            return modal.style.display = "flex"
        }
        
        function isModalOn() {
            return modal.style.display = "flex"
        }
        
        function modalOff() {

            return modal.style.display = "none"
        }
        
        const btnModal = document.getElementById("btn")
        btnModal.addEventListener("click", e => {
            modalOn()
        })
        
        closeBtn.addEventListener("click", e => {
            modalOff()
        })
        
        modal.addEventListener("click", e => {
            const evTarget = e.target
            if(evTarget.classList.contains("modal-overlay")) {
                modalOff()
            }
        })
    }
 
  
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    var calendar = new FullCalendar.Calendar(calendarEl, {

      initialDate: '2022-05-27',
      initialView: 'timeGridWeek',
      nowIndicator: true,
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'timeGridWeek'
      },
      navLinks: true, // can click day/week names to navigate views
      editable: true,
      selectable: true,
      selectMirror: true,
      dayMaxEvents: true,
      locale: 'ko',
      // allow "more" link when too many events
      events: [
      ]
    });

    calendar.render();
    calendar.on('dateClick', function(info) {

      var start = prompt('취침 시간');
      var end = prompt('기상 시간');
      
      console.log(start + end);
      calendar.addEvent( {'title': "취침",
          'start': info.dateStr + 'T' + start,
          'end': info.dateStr + 'T' + end});
      
      day.push(info.dateStr) // 취침날짜
      
      var start_hour = parseInt(start[0]) * 600 + parseInt(start[1]) * 60
      var start_min = parseInt(start[3] + start[4])
      var end_hour = parseInt(end[0]) * 600 + parseInt(end[1]) * 60
      var end_min = parseInt(end[3] + end[4])
      var time = ((end_hour + end_min) - (start_hour - start_min)) / 60 // 취침 시간

      sleep_time.push(time)
      
      console.log('취침날짜: ' + day + '취침시간: ' + sleep_time);
      
      let tagArea = document.getElementsByClassName("content")[0];
      let new_pTag = document.createElement('p');     
      new_pTag.setAttribute('class', 'pTag');
    
      let adviser = "완벽한 수면 패턴입니다!"
      
      if (sleep_time[counter] > 7) {
          adviser_time = sleep_time[counter] - 7          
          adviser = adviser_time + "시간만 덜 자세요"
      } else if (sleep_time[counter] < 7) {
          adviser_time = 7 - sleep_time[counter]
          adviser = adviser_time + "시간만 더 자세요"
      }           
      new_pTag.innerHTML = '취침날짜: ' + day[counter] + ' 취침시간: ' + sleep_time[counter] + ' --> ' + adviser;           
      counter = counter + 1;
      tagArea.appendChild(new_pTag);
    });
   });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 700px;
    margin: 0 auto;
  }
    
  #btn {
      width: 100px;
      padding-top : 30px;
      margin: 0 auto;
  }
    
  #park {
      width: 100px;
      padding-top: 10px;
      margin: 0 auto;
  }

</style>
</head>
<body>
<jsp:include page="../layout/top.jsp" flush="false" />
  <div id='calendar'></div>
  <div id='btn'>
      <input type = 'button' value = '추천 수면 패턴' />
  </div>
  
  <div id="modal" class="modal-overlay">
          <div class="modal-window">
              <div class="title">
                  <h2>추천 수면</h2>
              </div>
              <div class="close-area">X</div>
              <div class="content">
              </div>
          </div>
      </div>
</body>
</html>