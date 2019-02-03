class MoviesController < ApplicationController

  get '/movies/new' do
    erb :'movies/new'
  end

  get '/movies' do
    @movie = Movie.all
    erb :'users/show'
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
    if logged_in?
      if @movie.user == current_user
        erb :'movies/edit'
      else
        redirect "users/#{current_user.id}"
      end
    else
    redirect '/'
    end
  end

  patch '/movies/:id' do
    @movie = Movie.find(params[:id])
    if logged_in?
      if @movie.user == current_user
    @movie.update(title: params[:title], release_date: params[:release_date])
    redirect to "/movies/#{@movie.id}"
      else
        redirect "users/#{current_user.id}"
      end
    else
    redirect '/'
    end
  end

  delete '/movies/:id/delete' do
    @movie = Movie.find(params[:id])
    @movie.destroy
      redirect '/users/show'
  end
end
