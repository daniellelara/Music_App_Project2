get '/login' do
  @user = User.new
  erb :'sessions/new'
  
end

#handle the form 
post '/login' do
  user = User.find_by_email(params[:user][:email])
  if user && user.authenticate(params[:user][:password])
    #login
    session[:user_id] = user.id 
    flash[:success] = "Welcome!"
    redirect "/users/#{user.id}" 
  else
  #render the login form agian
  flash[:danger] = "Username or password incorrect"
  redirect '/login'
  end

end

#destroy the session
get '/logout' do
  session.clear
  redirect "/login"
end  