class Session_cotroller < ApplicationController
    get '/login' do
        erb :'/users/login'
          end
          

    post '/login' do
      @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id 

            redirect "/address"
        else
            flash[:error] = "Please check username and password to log in."
         redirect "/login"
   end
end




get '/index' do
            erb :'/address/index'
    end




    get '/logout' do
       session.clear
    redirect '/'
        end

end


