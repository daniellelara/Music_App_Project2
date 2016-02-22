helpers do
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def is_logged_in?
    !!current_user
  end
  
  def authorize!
    unless is_logged_in?
      flash[:danger] = "you must log in to view this page"
      redirect '/login'
    end
  end  
  
  #def disable
    #unless current_user
      #flash[:danger] = "you are not authorized to see this page"
      #redirect '/'
    #end
  #end

  def remove_user_from_track
       user = User.find(params[:user][:id])
       track = user.tracks.find(params[:tracks][:id])

       if track
          user.tracks.delete(track)
       end

    end 

  def remove_track_from_playlist  
     track = Track.find(params[:track][:id])
     playlist = track.playlists.find(params[:playlists][:id])

     if playlist
        track.playlists.delete(playlist)
     end

  end    


end