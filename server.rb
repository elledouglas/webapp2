# require 'sinatra'
# get '/home' do
#   erb :index
# end
#
# get '/portfolio' do
#   erb :gallery
# end
#
# get '/about_me' do
#   @skills = ['git', 'HTML', 'CSS', 'Ruby']
#   @interests = ['cats', 'art', 'music', 'films', 'coffee']
#   erb :about
# end
#
# get '/contacts/:id' do
#   # params[:id] contains the id from the URL
#   @contact = Contact.find(params[:id].to_i)
#   erb :show_contact
# end
#
# get '/fav' do
# @fav_links = ['https://www.w3schools.com', 'https://www.w3schools.com']
# erb :fav
# end
