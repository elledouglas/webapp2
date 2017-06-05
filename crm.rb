require 'sinatra'
require_relative './contact'



get '/home' do
erb :index
end

# get '/contacts' do
#   @contact = ['first_name', 'last_name', 'email', 'note']
 #erb:contacts
 #end

# get 'contacts/:id' do
# 'params[:id]'
# end
get '/contacts/new' do
erb :new
end

 get '/contacts' do
 @contacts = Contact.all
 erb :contacts
 end

get '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end



after do
  ActiveRecord::Base.connection.close
end
