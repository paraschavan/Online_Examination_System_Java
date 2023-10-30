<%@page import="oes.ExamDAO" %>
<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8">
  <title>CodePen - Javascript Countdown</title>
 <link rel="stylesheet" href="ajax.css">
<link rel="stylesheet" href="./timer.css">

</head>
<body>
<div class="tbody">
<!-- partial:index.partial.html -->
<div class="timer">
   <div class="timer--clock">
      <div class="minutes-group clock-display-grp">
         <div class="first number-grp">
            <div class="number-grp-wrp">
               <div class="num num-0"><p>0</p></div>
               <div class="num num-1"><p>1</p></div>
               <div class="num num-2"><p>2</p></div>
               <div class="num num-3"><p>3</p></div>
               <div class="num num-4"><p>4</p></div>
               <div class="num num-5"><p>5</p></div>
               <div class="num num-6"><p>6</p></div>
               <div class="num num-7"><p>7</p></div>
               <div class="num num-8"><p>8</p></div>
               <div class="num num-9"><p>9</p></div>
            </div>
         </div>
         <div class="second number-grp">
            <div class="number-grp-wrp">
               <div class="num num-0"><p>0</p></div>
               <div class="num num-1"><p>1</p></div>
               <div class="num num-2"><p>2</p></div>
               <div class="num num-3"><p>3</p></div>
               <div class="num num-4"><p>4</p></div>
               <div class="num num-5"><p>5</p></div>
               <div class="num num-6"><p>6</p></div>
               <div class="num num-7"><p>7</p></div>
               <div class="num num-8"><p>8</p></div>
               <div class="num num-9"><p>9</p></div>
            </div>
         </div>
      </div>
      <div class="clock-separator"><p>:</p></div>
      <div class="seconds-group clock-display-grp">
         <div class="first number-grp">
            <div class="number-grp-wrp">
               <div class="num num-0"><p>0</p></div>
               <div class="num num-1"><p>1</p></div>
               <div class="num num-2"><p>2</p></div>
               <div class="num num-3"><p>3</p></div>
               <div class="num num-4"><p>4</p></div>
               <div class="num num-5"><p>5</p></div>
               <div class="num num-6"><p>6</p></div>
               <div class="num num-7"><p>7</p></div>
               <div class="num num-8"><p>8</p></div>
               <div class="num num-9"><p>9</p></div>
            </div>
         </div>
         <div class="second number-grp">
            <div class="number-grp-wrp">
               <div class="num num-0"><p>0</p></div>
               <div class="num num-1"><p>1</p></div>
               <div class="num num-2"><p>2</p></div>
               <div class="num num-3"><p>3</p></div>
               <div class="num num-4"><p>4</p></div>
               <div class="num num-5"><p>5</p></div>
               <div class="num num-6"><p>6</p></div>
               <div class="num num-7"><p>7</p></div>
               <div class="num num-8"><p>8</p></div>
               <div class="num num-9"><p>9</p></div>
            </div>
         </div>
      </div>
   </div>
</div>

<!-- partial -->
  <script src='ajax.js'></script>
<%
ExamDAO td=(ExamDAO)session.getAttribute("ExamDAO");
%>  
  <script>
  TweenLite.defaultEase = Expo.easeOut;

  initTimer("00:"+<%=td.timeLeft()%>+""); // other ways --> "0:15" "03:5" "5:2"

  var timerEl = document.querySelector('.timer');

  function initTimer (t) {
     
     var self = this,
         timerEl = document.querySelector('.timer'),
         minutesGroupEl = timerEl.querySelector('.minutes-group'),
         secondsGroupEl = timerEl.querySelector('.seconds-group'),

         minutesGroup = {
            firstNum: minutesGroupEl.querySelector('.first'),
            secondNum: minutesGroupEl.querySelector('.second')
         },

         secondsGroup = {
            firstNum: secondsGroupEl.querySelector('.first'),
            secondNum: secondsGroupEl.querySelector('.second')
         };

     var time = {
        min: t.split(':')[0],
        sec: t.split(':')[1]
     };

     var timeNumbers;

     function updateTimer() {

        var timestr;
        var date = new Date();

        date.setHours(0);
        date.setMinutes(time.min);
        date.setSeconds(time.sec);

        var newDate = new Date(date.valueOf() - 1000);
        var temp = newDate.toTimeString().split(" ");
        var tempsplit = temp[0].split(':');

        time.min = tempsplit[1];
        time.sec = tempsplit[2];

        timestr = time.min + time.sec;
        timeNumbers = timestr.split('');
        updateTimerDisplay(timeNumbers);

        if(timestr != '0000')
           setTimeout(updateTimer, 1000);

     }

     function updateTimerDisplay(arr) {

        animateNum(minutesGroup.firstNum, arr[0]);
        animateNum(minutesGroup.secondNum, arr[1]);
        animateNum(secondsGroup.firstNum, arr[2]);
        animateNum(secondsGroup.secondNum, arr[3]);

     }

     function animateNum (group, arrayValue) {

        TweenMax.killTweensOf(group.querySelector('.number-grp-wrp'));
        TweenMax.to(group.querySelector('.number-grp-wrp'), 1, {
           y: - group.querySelector('.num-' + arrayValue).offsetTop
        });

     }
     
     setTimeout(updateTimer, 1000);

  }



  </script>
</div>
</body>
</html>
