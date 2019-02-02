class UsersController < ApplicationController

  get '/users/signup' do
      erb :'users/signup'
    end

  post '/signup' do
    if params[:username] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      @user.save
      redirect to '/users/#{@user.id}'
      erb :'/users/show'
    else
      redirect to 'users/signup'
    end
  end

  get '/users/:id' do
    erb :'/users/show'
  end

  get '/users/login' do
    if !session[:user_id]
      erb :'users/login'
    else
      redirect to 'users/show'
    end
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      puts session
      redirect to 'users/#{@user.id}'
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
