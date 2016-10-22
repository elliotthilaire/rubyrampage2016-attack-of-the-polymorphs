require 'sinatra'

enable :sessions

get '/' do
  if session[:page]
    redirect to session[:page]
  else
    redirect to '/to-kick-or-not-to-kick'
  end

end

get '/to-kick-or-not-to-kick' do
  session[:page] = '/to-kick-or-not-to-kick'
  erb :'story/to-kick-or-not-to-kick'
end

get '/run-away' do
  session[:page] = '/run-away'
  erb :'story/run-away'
end

get '/abduction' do
  session[:page] = '/abduction'
  erb :'story/abduction'
end

get '/first-encounter' do
  session[:page] = '/first-encounter'
  erb :'story/first-encounter'
end

get '/talking-sheep' do
  session[:page] = '/talking-sheep'
  erb :'story/talking-sheep'
end

get '/fin' do
  session[:page] = '/fin'
  erb :'story/fin'
end

get '/play-again' do
  session.clear
  redirect to '/'
end
