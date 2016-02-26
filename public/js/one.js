$(function() {
  // var track_source = [];


if(!window.location.pathname.match(/tracks/)){
  return;
}

console.log("loaded");
  var track = $('audio')[0];
  var canvas = $('canvas')[0];

  
  makinWaves(track, canvas);
 
  console.log("working");
  // for(var i=0; i< track_source.length; i++) {
  //   window.sound = new Audio(track_source[i]);
  //   tracklist.push(sound);
  // };

  var x = track.length; // Count total audio players
  console.log(3);
  $(".play-bt-track").click(function(e){
    e.preventDefault();
    console.log(track);
    track.play();
    console.log(track, "playing");
    $(".message-track").text("playing " + " " + (track.src.split('/').splice(-1)[0]));
  });

  $(".pause-bt-track").click(function(e){
    e.preventDefault();
    var idx = $(this).parents('.tracks').index();
    track.pause();
    console.log(track, "playing");
    $(".message-track").text("");
  });

});        
