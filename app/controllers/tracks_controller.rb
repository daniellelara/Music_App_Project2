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
  
  if @track.save
    @track.users << @current_user
    redirect "/tracks"
  else
    erb :"tracks/index"
  end
end

#SHOW
get "/tracks/:id" do
  authorize!
  @track = Track.find(params[:id])
    erb :"tracks/show"
  
end
#add track to playlist
get "tracks/:id/playlist" do
  authorize!
  @playlist = @current_user.playlists
  erb :"tracks/playlist"
end   

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
  if @track.update(params[:track])
    redirect "/tracks/#{@track.id}"
  else
    erb :"tracks/show"
  end
end

delete "/tracks/:id" do
  authorize!
  @track = Track.find(params[:id])
  @track.destroy
  redirect("/")
end