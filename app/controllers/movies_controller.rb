class MoviesController < ApplicationController

  get '/movie_list' do
    if !Helpers.is_logged_in?(session)
      redirect to '/login'
    else
  	  @movies = Movie.all
      @user = Helpers.current_user(session)
      erb :'/movies/movie_list'
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
  	  erb	:'/movies/movie_list'
    end
  end

  post '/movies' do
    @movie = Movie.create(:title => params[:movie])
    @movie.save
    redirect to "/movie_list/#{@movie.id}"
    end
  end
