$(function() {
 
 
    var playlist = $('.playlist_tracks').find('audio').toArray();
    var $canvases = $('canvas');

    playlist.forEach(function(elem, idx) {
      makinWaves(elem, $canvases[idx]);
    });

//  var source = [];
//  $('.playlist_tracks').find('audio').each(function() {
//       source.push($(this).attr('src'));
//   });

// var playlist = [];
// for (var i=0; i< source.length; i++) {
//   var sound = new Audio(source[i]);
//   playlist.push(sound);
//  };
 

 var x = playlist.length; // Count total audio players
 var z = 0; // Start at first audio player

     $("#play-bt").click(function(){
      console.log(playlist);
            
            playlist[z].play();
         $(".message").text("Music started");
     })
     $("#pause-bt").click(function(){
         playlist[z].pause();
         $(".message").text("Music paused");
     })
     $("#stop-bt").click(function(){
         playlist[z].pause();
         playlist[z].currentTime = 0;
         $(".message").text("Music Stopped");
     })
     $("#next-bt").click(function(){
         playlist[z].pause();
         z++;
         if (z >= x) z = 0;
         playlist[z].play();
         $(".message").text("Track: "+z);
     }) 

     $("#play-all").click(function(){
     var i = 0
     playlist[i].play();
     $(".message").text("Track: "+i);
     for (i = 0; i < playlist.length - 1; ++i) {
         playlist[i].addEventListener('ended', function(e){
             var currentSong = e.target;
             var next = $(currentSong).nextAll('audio');
             if (next.length) $(next[0]).trigger('play');
             $(".message").text("Track: "+i);
         });
     }
   });
  });        