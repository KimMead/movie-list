class UsersController < ApplicationController

  get '/users/signup' do
    if !session[:user_id]
      erb :'users/signup'
    else
      redirect to '/movie_list'
    end
  end

  post '/signup' do
    if params[:username] == "" || params[:email] == "" || params[:password] == ""
      redirect to '/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/movie_list'
    end
  end

  get '/users/login' do
    if Helpers.is_logged_in?(session)
      redirect to '/movie_list'
    else
      erb :'users/login'
    end
  end

  post '/login' do
    @user = User.find_by(username: params["username"], password: params["password"])
    if !@user
      redirect to '/login'
    else
      session[:user_id] = @user.id
      redirect to '/movie_list'
     end
   end

   get 'users/:slug' do
     @user = User.find_by_slug(params[:slug])
     erb :'user/show'
   end
 end
