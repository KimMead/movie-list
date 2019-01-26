class MoviesController < ApplicationController

  get '/movies' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    else
  	  @movies = Movie.all
      @user = Helpers.current_user(session)
      erb :'/movies/list'
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
  	  erb	:'/movies/list'
    end
  end

  post '/movies' do
    @movie = Movie.create(:title => params[:movie])
    redirect to "/list/#{@movie.id}"
    end
  end
