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
      redirect to 'users/signup'
    else
      @user = User.new(username: params[:username], email: params[:email], password: params[:password])
      @user.save
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
    @user = User.find_by(username: params["username"], password: params["password"])
    if @user
      session[:user_id] = user.id
      redirect to '/movie_list'
    else
      redirect to '/signup'
     end
   end

   get '/logout' do
    if session[:user_id] != nil
      session.destroy
      redirect to 'users/login'
    else
      redirect to '/index'
    end
  end
end
