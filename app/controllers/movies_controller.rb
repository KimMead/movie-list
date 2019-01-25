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
end
