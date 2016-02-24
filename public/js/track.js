$(function() {
  // var track_source = [];
  var tracklist = $('.pure-g').find('audio').toArray();
  var $canvases = $('canvas');

  tracklist.forEach(function(elem, idx) {
    makinWaves(elem, $canvases[idx]);
  });
  
  // for(var i=0; i< track_source.length; i++) {
  //   window.sound = new Audio(track_source[i]);
  //   tracklist.push(sound);
  // };

  var x = tracklist.length; // Count total audio players
 
  $(".play-bt-track").click(function(e){
    e.preventDefault();
    var idx = $(this).parent().index();
    tracklist[idx].play();
    console.log(tracklist[idx], "playing");
    $(".message").text("playing");
  });
  $(".pause-bt-track").click(function(e){
    e.preventDefault();
    var idx = $(this).parent().index();
    tracklist[idx].pause();
    console.log(tracklist[idx], "playing");
    $(".message").text("paused");
  });

});        


