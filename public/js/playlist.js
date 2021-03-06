$(function() {

  if(!window.location.pathname.match(/playlists/)){
    return;
  }
  
  var $audio = $('audio');
  var $canvas = $('canvas');
  var filenames = $('.filename').toArray().map(function(elem) {
    return elem.value;
  });

  makinWaves($audio[0], $canvas[0]);

//  var source = [];
//  $('.playlist_tracks').find('audio').each(function() {
//       source.push($(this).attr('src'));
//   });

// var playlist = [];
// for (var i=0; i< source.length; i++) {
//   var sound = new Audio(source[i]);
//   playlist.push(sound);
//  };


     var playlistLength = filenames.length; // Count total audio players
     var currentIdx = 0; // Start at first audio player

     $audio[0].src = filenames[currentIdx];

     $(".play-bt").click(function(){
      $audio[0].play();
      
      $(".message").text("music started");
    })
     $(".pause-bt").click(function(){
      $audio[0].pause();
      $(".message").text("music paused");
    })
     $(".stop-bt").click(function(){
       $audio[0].pause();
       $audio[0].currentTime = 0;
       $(".message").text("music Stopped");
     })
     $(".next-bt").click(function(){

      currentIdx++;
      $audio[0].pause();
      $audio[0].src = filenames[currentIdx];
      $audio[0].play();
      $(".message").text("Track: "+ filenames[currentIdx]);
    }) 
     $(".previous-bt").click(function(){
      currentIdx--;
      $audio[0].pause();
      $audio[0].src = filenames[currentIdx];
      $audio[0].play();
      $(".message").text("Track: ");
    }) 

     $("#play-all").click(function(){
       $audio[0].play();
       $(".message").text("track: $audio[0] ");
       $audio[0].addEventListener('ended', function(e){
        currentIdx++;
        $audio[0].pause();
        $audio[0].src = filenames[currentIdx];
        $audio[0].play();
        $(".message").text("Track: "+ filenames[currentIdx]);
      });
     });
   });        