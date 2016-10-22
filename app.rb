require 'sinatra'

enable :sessions

get '/' do
  session[:page] = 'to-kick-or-not-to-kick' unless session[:page]

  erb "story/#{session[:page]}".to_sym
end

get '/to-kick-or-not-to-kick' do
  session[:page] = 'to-kick-or-not-to-kick'
  redirect to '/'
end

get '/run-away' do
  session[:page] = 'run-away'
  redirect to '/'
end

get '/abduction' do
  session[:page] = 'abduction'
  redirect to '/'
end

get '/first-encounter' do
  session[:page] = 'first-encounter'
  redirect to '/'
end

get '/talking-sheep' do
  session[:page] = 'talking-sheep'
  redirect to '/'
end

get '/fin' do
  session[:page] = 'fin'
  redirect to '/'
end

get '/play-again' do
  session.clear
  redirect to '/'
end
