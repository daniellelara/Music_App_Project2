get "/" do

    erb :'static/home'
end

get "/results" do
  if params[:search] && !params[:search].empty?
    @users = User.where("name ILIKE :search OR username ILIKE :search OR city ILIKE :search", { search: "%#{params[:search]}%"}).order(created_at: :asc)
    @tracks =Track.where("title ILIKE :search OR genre ILIKE :search OR  artist ILIKE :search", { search: "%#{params[:search]}%"}).order(created_at: :asc)
    @playlists = Playlist.where("title ILIKE :search OR genre ILIKE :search", { search: "%#{params[:search]}%"}).order(created_at: :asc)
  else  
    @users = User.all
    @playlists = Playlist.all
    @tracks = Track.all
  end
  erb :'static/results'
end

get "/tracksall" do
  @tracks = Track.all

  erb :'static/results'
end  

