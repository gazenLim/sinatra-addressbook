class UserController < ApplicationController
    
    get '/signup' do 
        @users = User.all
    erb :'/users/signup'

    end

   
    
    post '/users/signup' do
        @user = User.new(params)
        if @user && @user.save
            session[:user_id] = @user.id
            redirect "/address"
        else 
            flash[:error] = "Please check username and password to log in."
           erb :'/users/login'
    end
end
end

   