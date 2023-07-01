<!DOCTYPE html>
<html>
<head>
  <title>Stopwatch</title>
  <style>
    #timer {
      font-size: 48px;
      margin-bottom: 20px;
    }
    #start, #stop, #reset {
      font-size: 24px;
      padding: 5px 10px;
    }
  </style>
</head>
<body>
  <div id="timer">00:00:00</div>
  <button id="start">Start</button>
  <button id="stop">Stop</button>
  <button id="reset">Reset</button>

  <script>
    var timer = document.getElementById('timer');
    var startButton = document.getElementById('start');
    var stopButton = document.getElementById('stop');
    var resetButton = document.getElementById('reset');

    var startTime;
    var elapsedTime = 0;
    var timerInterval;

    function formatTime(milliseconds) {
      var hours = Math.floor(milliseconds / 3600000);
      var minutes = Math.floor((milliseconds % 3600000) / 60000);
      var seconds = Math.floor((milliseconds % 60000) / 1000);

      hours = hours.toString().padStart(2, '0');
      minutes = minutes.toString().padStart(2, '0');
      seconds = seconds.toString().padStart(2, '0');

      return hours + ':' + minutes + ':' + seconds;
    }

    function startTimer() {
      startTime = Date.now() - elapsedTime;
      timerInterval = setInterval(function() {
        var currentTime = Date.now();
        elapsedTime = currentTime - startTime;
        timer.textContent = formatTime(elapsedTime);
      }, 10);

      startButton.disabled = true;
      stopButton.disabled = false;
    }

    function stopTimer() {
      clearInterval(timerInterval);

      startButton.disabled = false;
      stopButton.disabled = true;
    }

    function resetTimer() {
      clearInterval(timerInterval);
      elapsedTime = 0;
      timer.textContent = '00:00:00';

      startButton.disabled = false;
      stopButton.disabled = true;
    }

    startButton.addEventListener('click', startTimer);
    stopButton.addEventListener('click', stopTimer);
    resetButton.addEventListener('click', resetTimer);
  </script>
</body>
</html>
