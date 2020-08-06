class SessionsController < ApplicationController
    get '/signin' do
       erb :'/user/signin' 
    end

    post '/signin' do
        if params[:username].empty? || params[:password].empty?
            @error = 'Username and Password Required'
            erb :'user/signin'
        else
            @user = User.find_by(username: params[:username])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect to '/songs'
            else
                @error = 'Acount Not Found'
                erb :'user/signin'
            end
        end
    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end