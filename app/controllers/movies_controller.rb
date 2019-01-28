class MoviesController < ApplicationController

  get '/movie_list' do
    redirect_if_not_logged_in
    @movies = Movie.all
      erb :'movies/movie_list'
  end

  get '/movies/new' do
    redirect_if_not_logged_in
    @error_message = params[:error]
    erb :'movies/new'
  end

  get '/movies/:id' do
    redirect_if_not_logged_in
  	@movie = Movie.find(params[:id])
  	erb	:'movies/movie_show'
  end

  post '/movies' do
    @movie = Movie.create(:title => params[:title])
    @movie.save
    redirect to "/movie_list"
    end

  get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :'movies/edit'
  end

  patch '/movies/:id' do
    @movie = Movie.find(params[:id])
    @article.update(title: params[:title])
    redirect to ('/movies/#{@movie.id}')
  end
end
