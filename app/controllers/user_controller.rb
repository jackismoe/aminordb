require './config/environment'

class UserController < ApplicationController
# create
    get '/signup' do
        erb :'user/signup'
    end

    post '/signup' do
        @user = User.new(params)

        if @user.save
            session[:user_id] = @user.id
            redirect to '/songs'
        else
            @error = 'Invalid Credentials'
            erb :'user/signup'
        end
    end

# read
    get '/profile' do
        @songs = current_user.songs

        erb :'user/profile'
    end

# update
    get '/profile/edit' do
        @user = current_user
        
        erb :'user/edit'
    end

    patch '/profile/edit/:id' do
        @user = current_user
        if params[:password].empty? || params[:confirm_password].empty?
            @error = "Password cannot be empty"
            erb :'/user/edit'
        elsif params[:password] == current_user.password
            @error = 'Password must be different.'
            erb :'/user/edit'
        elsif params[:password] != params[:confirm_password]
            @error = 'Passwords must match.'
            erb :'/user/edit'
        else
            @user.update(username: params[:username], password: params[:password])            
            redirect to '/profile'
        end
    end
    
 # destroy
    get '/profile/delete' do
        erb :'/user/delete'
    end

    delete '/user/' do
        @user = current_user
        session.clear
        @user.destroy
        redirect to '/'
    end
end