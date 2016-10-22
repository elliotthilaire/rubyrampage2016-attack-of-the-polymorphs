require 'sinatra'

get '/' do
  redirect to '/to-kick-or-not-to-kick'
end

get '/to-kick-or-not-to-kick' do
  erb :'story/to-kick-or-not-to-kick'
end
