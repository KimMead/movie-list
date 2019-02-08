require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do

  def logged_in?(session_hash)
    !!current_user
  end

  def current_user(session_hash)
    @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
