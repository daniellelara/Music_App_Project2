$(function() {

  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  var context = new AudioContext();
  var analyser = context.createAnalyser();
  var audio = document.getElementsByTagName('audio')[0];
  var source = context.createMediaElementSource(audio);
 
  source.connect(analyser);
  analyser.connect(context.destination);

  analyser.fftSize = 256;
  
  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);
  var c = document.getElementsByTagName("canvas")[0];
  var canvasCtx = c.getContext("2d");
  var canvasHeight = c.height;
  var canvasWidth = c.width;
  canvasCtx.clearRect(0, 0, canvasWidth, canvasHeight);
  console.log(dataArray);
  
  function draw() {
    drawVisual = requestAnimationFrame(draw);

    analyser.getByteFrequencyData(dataArray);
    canvasCtx.fillStyle = 'rgb(139, 131, 131)';
    canvasCtx.fillRect(10,10,canvasWidth,canvasHeight);
    var barWidth = (canvasWidth / bufferLength) * 2.5;
    var barHeight;
    var x = 0;

    for(var i = 0; i < bufferLength; i++) {
      barHeight = dataArray[i]/2;

      canvasCtx.fillStyle = 'rgb(' + (barHeight+200) + ',255,255)';
      canvasCtx.fillRect(x,canvasHeight-barHeight/2,barWidth,barHeight);

      x += barWidth + 1;
    }
  };

  draw();

});