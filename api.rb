require 'sinatra'

get '/restaurants' do
  content_type 'application/json'
  send_file 'tmp/restaurants.json'
end
