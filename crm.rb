require 'sinatra'
require_relative './contact'



get '/' do
erb :index
redirect '/contacts'
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
  @contact = Contact.find_by(id: params[:id])
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end


post '/contacts' do
  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
  redirect to ('/contacts')
end

get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id])
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id])
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end

end
after do
  ActiveRecord::Base.connection.close
end
