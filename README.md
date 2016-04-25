# Music_App_Project2

ALIZE

Combining my love of music and programming, I created a music streaming and download/upload service with audio player visualization and the ability to share, play and create playlists. Using Postgress, I had 3 models, all many to many relationships. The visualization on the audio players used Web API, Audiocontext to analyze the track, thereafter plotting the data onto a HTML5 canvas to create the soundwave visual. Audiocontext was my biggest challenge. I had never used it before so was unable to predict the Cors restrictions I ran into. It was only realised on the final day of the project when I discovered that an audio node can only be connected to 5 audio sources at one time. In addition, after heroku deployment, I decided to store my mp3 files on AS3 storage, this brought up another challenge of music streaming from a  remote server.

Used: Sinatra framework, Ruby, JavaScript, psql, bcrypt, carrierwave, html5 canvas, web audio API, Audiocontext