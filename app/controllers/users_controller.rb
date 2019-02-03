class UsersController < ApplicationController

  get '/users/login' do
      erb :'users/login'
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect to "users/#{@user.id}"
    else
      redirect to '/signup'
     end
   end

   get '/users/signup' do
       erb :'users/signup'
     end

   post '/signup' do
     if params[:username] != "" && params[:email] != "" && params[:password] != ""
       @user = User.create(params)
       @user.save
       redirect to "/users/#{@user.id}"
     else
       redirect to 'users/signup'
     end
   end

   get '/users/:id' do
     @user = User.find_by(id: params[:id])
     erb :'users/show'
   end

   get '/logout' do
      session.clear
      redirect to '/'
  end
end
