require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

    register Sinatra::ActiveRecordExtension
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"

  get '/' do
    erb :index
  end

  helpers do
    def is_logged_in?
      !!session[:user_id]
    end

  def current_user
    User.find(session[:user_id])
  end
end
end
