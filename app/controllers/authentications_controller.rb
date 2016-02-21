get '/register' do
   @user = User.new
   erb :'authentications/new'
end

#handle the form
post '/register' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id 
    flash[:success] = "thanks for registering!"
    redirect '/users'
  else 
    erb :'authentications/new'
  end    
end  