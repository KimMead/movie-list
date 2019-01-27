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
      session[:user_id] = @user.id
      redirect to '/movie_list'
    end
  end

  get '/users/login' do
    @error_message = params[:error]
    if !session[:user_id]
      erb :'users/login'
    else
      redirect to '/movie_list'
    end
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect to '/movie_list'
    else
      redirect to '/signup'
     end
   end

   get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to '/login'
    else
      redirect to '/'
    end
  end

   get 'users/:slug' do
     @user = User.find_by_slug(params[:slug])
     erb :'users/show'
   end
 end
