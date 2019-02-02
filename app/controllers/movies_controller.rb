class MoviesController < ApplicationController

  get '/movies/new' do
    erb :'movies/new'
  end

  post '/movies' do
    @movie = Movie.create(:title => params[:title])
    @movie.save
    redirect to '/users/show'
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
    @article.update(title: params[:title])
    redirect to ('/movies/#{@movie.id}')
  end
end
