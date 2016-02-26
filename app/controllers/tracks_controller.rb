# INDEX
get "/tracks" do
  authorize!
  @tracks = @current_user.tracks
  erb :"tracks/index"
end

# NEW
get "/tracks/new" do
  authorize!
  @track = Track.new
  
  erb :"tracks/new"
end

# CREATE
post "/tracks" do
  authorize!

  @track = Track.new(params[:track])

  if(params[:playlist_id])
    playlist = Playlist.find(params[:playlist_id])
  end
  
  if @track.save
    @track.users << @current_user
    @track.playlist << playlist if playlist
    redirect "/tracks"
  else
    erb :"tracks/index"
  end
end

#SHOW
get "/tracks/:id" do
  authorize!
  @track = Track.find(params[:id])
  @users = @track.users 
    erb :"tracks/show"

  
end

#add track from other user
post "/tracks/:id/add" do
  authorize!
  @track = Track.find(params[:id])
  @track.users << @current_user
  redirect "/tracks"
end  
#add track to playlist
# get "/tracks/:id/playlist" do
#   authorize!
#   @track = Track.find(params[:id])
#   @playlists = @current_user.playlists
#   erb :"tracks/playlist"
# end   

# EDIT
get "/tracks/:id/edit" do
  authorize!
    @track = Track.find(params[:id])
    erb :"tracks/edit"
end

# UPDATE
put '/tracks/:id' do
  authorize!
  @track = Track.find(params[:id])

  if(params[:playlist_id])
    playlist = Playlist.find(params[:playlist_id])
    params[:track] = {}
  end

  if @track.update(params[:track])
    @track.playlists << playlist if playlist
    redirect "/tracks"
  else
    erb :"tracks/show"
  end
end

delete "/tracks/:id" do
  authorize!
  user = @current_user
  track = Track.find(params[:id])
  user.tracks.delete(track)
  
  
  redirect("/tracks")
end