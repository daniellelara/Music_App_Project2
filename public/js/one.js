$(function() {
  // var track_source = [];


if(!window.location.pathname.match(/tracks/)){
  return;
}

console.log("loaded");
  var track = $('audio');
  console.log(track);
  var $canvas = $('canvas');
  console.log($canvas);

  
    // makinWaves(track, $canvas);
 
  console.log("working");
  // for(var i=0; i< track_source.length; i++) {
  //   window.sound = new Audio(track_source[i]);
  //   tracklist.push(sound);
  // };

  var x = track.length; // Count total audio players
  console.log(3);
  $(".play-bt-track").click(function(e){
    e.preventDefault();
    
    track.play();
    console.log(tracklist[0], "playing");
    $(".message-track").eq(idx).text("playing " + " " + (tracklist[idx].src.split('/').splice(-1)[0]));
  });

  $(".pause-bt-track").click(function(e){
    e.preventDefault();
    var idx = $(this).parents('.tracks').index();
    tracklist[idx].pause();
    console.log(tracklist[idx], "playing");
    $(".message-track").eq(idx).text("");
  });

});        
