class UsersController < ApplicationController

  get '/users/signup' do
    erb :'users/signup'
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/movies'
    end
  end

  get '/users/login' do
      erb :'users/login'
    end

  post '/login' do
    @user = User.find_by(username: params["username"], password: params["password"])
    if !@user
      redirect to '/login'
    else
      session[:user_id] = @user.id
      redirect to '/movies'
     end
   end
end
