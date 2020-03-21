require 'sinatra'

get '/restaurants' do
  content_type 'application/json'
  send_file 'restaurants.json'
end
