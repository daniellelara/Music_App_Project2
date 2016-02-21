# INDEX
get "/users" do
  authorize!
  @users = User.all
  erb :"users/index"
end

# NEW
get "/users/new" do
  authorize!
  @user = User.new
  erb :"users/new"
end

# CREATE
post "/users" do
  authorize!
  @user = User.new(params[:user])
  if @user.save
    redirect "/users"
  else
    erb :"users/new"
  end
end

# SHOW
get "/users/:id" do
  authorize!
  @user = User.find(params[:id])
  if @user
    erb :"users/show"
  else
    redirect "/users"
  end
end

# EDIT
get "/users/:id/edit" do
  authorize!
  @user = User.find(params[:id])
  erb :"users/edit"
end

# UPDATE
put '/users/:id' do
  authorize!
  @user = User.find(params[:id])
  if @user.update(params[:user])
    redirect "/users/#{@user.id}"
  else
    erb :"users/show"
  end
end

delete "/users/:id" do
  authorize!
  @user = User.find(params[:id])
  session.clear
  @user.destroy
  redirect("/")
end