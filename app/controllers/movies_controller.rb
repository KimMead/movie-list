class MoviesController < ApplicationController

  get '/movies' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    else
  	  @movies = Movie.all
      @user = Helpers.current_user(session)
      erb :'/movies/movies'
    end
  end

  get '/movies/new' do
    if Helpers.is_logged_in?(session)
      erb :'/movies/new'
    else
  	  redirect to '/login'
    end
  end

  get '/movies/:id' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    else
  	  @movie = Movie.find_by_id(params[:id])
  	  erb	:'/movies/movies'
    end
  end

  post '/movies' do
      if params[:content] == ""
        redirect '/movies/new'
      else
        @movie = Movie.new(content: params[:content], user_id: session[:user_id])
        @movie.save
        redirect "/movies/#{@movie.id}"
      end
    end
end
