require './config/environment'

class ApplicationController < Sinatra::Base
  configure do
    enable  :sessions
    set     :session_secret, 'secret'
    set     :public_folder, 'public'
    set     :views, 'app/views'
  end

  get "/" do
    @songs = Song.all.sort_by(&:name)
    erb :index
  end


  # helpers
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
    # memoization ^
  end

  def signed_in?
    !!current_user
  end   

  def new_song
    current_user.songs.build(params['song'])
  end

  def users_song?(song)
    current_user.id == song.user_id
  end
end
