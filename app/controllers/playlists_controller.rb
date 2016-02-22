# INDEX
get "/playlists" do
  authorize!
  @playlists = @current_user.playlists
  erb :"playlists/index"
end

# NEW
get "/playlists/new" do
  authorize!
  @playlist = Playlist.new
  
  erb :"playlists/new"
end

# CREATE
post "/playlists" do
  authorize!

  @playlist = Playlist.new(params[:playlist])
  
  if @playlist.save
    @playlist.users << @current_user
    redirect "/playlists"
  else
    erb :"playlists/index"
  end
end

post "/playlists/:id" do
  #add track to playlist
  @playlist = Playlist.find(params[:id])
  @track.playlists << @playlist
  redirect '/tracks'
end   

#SHOW
get "/playlists/:id" do
  authorize!
  @playlist = Playlist.find(params[:id])
  @tracks = @playlist.tracks
  p @tracks
    erb :"playlists/show"
end

get "/playlists/:id/addtrack" do
  #button by track that add  track to playlist. pop up comes out, add or
  #create new
  #redirects to /tracks
  #message saying added
  authorize!
  @playlist = Playlist.find(params[:id])
  
end 

# EDIT
get "/playlists/:id/edit" do
  authorize!
    @playlist = Track.find(params[:id])
    erb :"playlists/edit"
end

# UPDATE
put '/playlists/:id' do
  authorize!
  @playlist = Playlist.find(params[:id])
  @playlist.update(params[:playlist])

  if @playlist.save
    redirect "/playlists/#{@playlist.id}"
  else
    erb :"playlists/show"
  end
end

delete "/playlists/:id" do
  #delete playlist from user relationship
  authorize!
  user = @current_user
  playlist = Playlist.find(params[:id])
  user.playlists.delete(playlist)
  redirect("/tracks")
end

delete"/playlists/:id/tracks" do
  authorize!
  playlist = Playlist.find(params[:id])
  track = Track.find(params[:id])
  playlist.tracks.delete(track)
  redirect("/tracks/:id")
end 
