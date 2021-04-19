class AddressController < ApplicationController

get '/address' do
    if logged_in?
@address = Address.all
erb :'/address/index'
    else
        redirect "/login"
    end

end


get '/address/new' do
    if logged_in?
erb :'/address/new'
else
    redirect "/login"
end
end




get '/address/created' do
@address = Address.where(user_id: current_user)
    erb :"/address/created"
    end

post '/address' do
# address = Address.new(params)
# address.user_id = current_user.id
@address = current_user.addresses.build(params)
if @address.save
    flash[:notice] = "Your address is Save."
    redirect "/address/#{@address.id}"
else
        erb :"/address/new"
end
end

get '/address/:id' do
    if logged_in?
    @address = Address.find_by_id(params[:id])
   erb :"/address/show"
else
    redirect "/login"
end
end


get '/address/:id/edit' do
    if logged_in?
    @address = Address.find(params[:id])
    if @address.user_id != current_user.id || @address.user_id == nil
        redirect '/address'
else
    erb :'/address/edit'

end
else
redirect "/login"
end
end

patch '/address/:id'  do
    @address = Address.find_by_id(params[:id])
    params.delete("_method")
    @address.update(params)

    if @address.update(params)
        flash[:note] = "Your address is Edit."
        redirect "/address/#{@address.id}"
    else
        redirect "/address/new"

    end

end

delete '/address/:id' do
    if logged_in?
@address = Address.find_by_id(params[:id])
    if @address.user_id != current_user.id || @address.user_id == nil
flash[:error]="This is not From your Profile"
redirect "/address"
    else 
        @address = Address.find_by_id(params[:id])
        flash[:error]="Your address is Deleted"

@address.delete
redirect "/address/created"

    end
end
end







end