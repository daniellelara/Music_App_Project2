$(function() {

  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  var context = new AudioContext();
  var analyser = context.createAnalyser();
  var audio = document.getElementById('audio');
  var source = context.createMediaElementSource(audio);
 
  source.connect(analyser);
  analyser.connect(context.destination);

  analyser.fftSize = 256;
  
  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);
  var c = document.getElementById("canvas");
  var canvasCtx = c.getContext("2d");
  canvasCtx.clearRect(0, 0, 300, 300);
  console.log(dataArray);
  
  function draw() {
    drawVisual = requestAnimationFrame(draw);

    analyser.getByteFrequencyData(dataArray);
    canvasCtx.fillStyle = 'rgb(139, 131, 131)';
    canvasCtx.fillRect(10,10,300,300);
    var barWidth = (300 / bufferLength) * 2.5;
    var barHeight;
    var x = 0;

    for(var i = 0; i < bufferLength; i++) {
      barHeight = dataArray[i]/2;

      canvasCtx.fillStyle = 'rgb(' + (barHeight+200) + ',255,255)';
      canvasCtx.fillRect(x,300-barHeight/2,barWidth,barHeight);

      x += barWidth + 1;
    }
  };

  draw();

});