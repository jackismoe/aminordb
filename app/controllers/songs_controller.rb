require './config/environment'

class SongsController < ApplicationController
# create
    get '/songs/new' do
        if signed_in?
            erb :'songs/new'
        else
            @error = 'You Must Be Signed In'
            erb :'user/signin'
        end
    end

    post '/songs' do
        @song = new_song
        if @song.save
            erb :'/songs/show'
        else
            @error = 'Data Invalid, Please Try Again'
            erb :'/songs/new'
        end
    end
    
# read
    get '/songs' do
        if signed_in?
            @song = Song.all.sort_by(&:name)
            erb :'songs/index'
        else
            erb :'user/signin'
        end
    end

    get '/songs/:id' do
        if signed_in?
            @song = Song.find_by(id: params[:id])
            if @song
                erb :'/songs/show'
            else
                redirect to '/songs'
            end
        else
            redirect to '/'
        end
    end

# update
    get '/songs/:id/edit' do
        @song = Song.find(params[:id])
        if users_song?(@song)
            erb :'/songs/edit'
        else
            @error = 'You may only edit songs that you have created.'
            erb :'/songs/show'
        end
    end

    patch '/songs/:id' do
        @song = Song.find(params[:id])
        if @song.update && !params['song']['chords'].empty? && users_song?(@song)
            redirect to "/songs/#{params[:id]}"
        else
            @error = 'Data Invalid, Please Try Again'
            erb :'/songs/edit'
        end
    end

# destroy
    delete '/songs/:id' do
        song = Song.find(params[:id])
        if user_song?(song)
          song.destroy
          redirect to '/profile' 
        end
    end
end