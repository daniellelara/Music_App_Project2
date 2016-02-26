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
  page = params[:p] ? params[:p].to_i : 1
  offset = (page - 1) * 5
  number_of_tracks = Track.all.count

  @number_of_pages = number_of_tracks / 5
  
  @number_of_pages += 1 if number_of_tracks % 5 != 0

  @tracks = Track.all.limit(5).offset(offset)


  erb :'static/alltrack'
end 

get "/playlistall" do
  @playlists = Playlist.all.order(title: :desc)

  erb :'static/playlists'
end  

