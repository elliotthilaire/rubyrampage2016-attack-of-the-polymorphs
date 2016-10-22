require 'sinatra'

get '/' do
  redirect to '/to-kick-or-not-to-kick'
end

get '/to-kick-or-not-to-kick' do
  erb :'story/to-kick-or-not-to-kick'
end

get '/run-away' do
  erb :'story/run-away'
end

get '/fin' do
  erb :'story/fin'
end
