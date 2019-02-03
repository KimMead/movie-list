class MoviesController < ApplicationController

  get '/movies/new' do
    erb :'movies/new'
  end

  post '/movies' do
    if !logged_in?
      redirect to '/'
    end
    if params[:title] != ""
    @movie = Movie.create(title: params[:title], user_id: current_user.id)
    redirect "/movies/#{@movie.id}"
  else
    redirect to '/movies/new'
  end
end

  get '/movies/:id' do
  	@movie = Movie.find(params[:id])
  	erb	:'movies/movie_show'
  end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :'movies/edit'
  end

  patch '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.update(title: params[:title], release_date: params[:release_date])
    redirect to ("/movies/#{@movie.id}")
  end

  get '/movies' do
    erb :'users/show'
  end
end
