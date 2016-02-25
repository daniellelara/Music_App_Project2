function makinWaves(audio, canvas) {

  console.log(audio, canvas);

  window.AudioContext = window.AudioContext || window.webkitAudioContext;
  var context = new AudioContext();
  var analyser = context.createAnalyser();
  var source = context.createMediaElementSource(audio);
 
  source.connect(analyser);
  analyser.connect(context.destination);

  analyser.fftSize = 2048;
  var bufferLength = analyser.frequencyBinCount;
  var dataArray = new Uint8Array(bufferLength);
  analyser.getByteTimeDomainData(dataArray);;
  var canvasCtx = canvas.getContext("2d");
  var canvasHeight = canvas.height;
  var canvasWidth = canvas.width;

  canvasCtx.clearRect(0, 0, canvasWidth, canvasHeight);
  
  function draw() {
    drawVisual = requestAnimationFrame(draw);
    analyser.getByteTimeDomainData(dataArray);
    canvasCtx.fillStyle = "rgba(0, 0, 200, 0.5)";
    canvasCtx.clearRect(0, 0, canvasWidth, canvasHeight);
    canvasCtx.lineWidth = 5;
    canvasCtx.strokeStyle = '#E6EAEE';
    canvasCtx.shadowBlur = 15
    canvasCtx.shadowColor = '#4d4951';
    canvasCtx.shadowOffsetX = 0;
    canvasCtx.shadowOffsetY = 0;
    
    canvasCtx.beginPath();


    var sliceWidth = canvasWidth * 1.0 / bufferLength;
    var x = 0;
    for(var i = 0; i < bufferLength; i++) {

      var v = dataArray[i] / 128.0;
      var y = v * canvasHeight/2;

      canvasCtx.strokeStyle = 'lightpurple';
      

      if(i === 0) {
        canvasCtx.moveTo(x, y);
      } else {
        canvasCtx.lineTo(x, y);
      }

      x += sliceWidth;
    }  
    canvasCtx.lineTo(canvas.width, canvas.height/2);

      canvasCtx.stroke();

    }; 

    draw();             
};