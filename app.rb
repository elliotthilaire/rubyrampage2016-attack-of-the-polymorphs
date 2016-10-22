require 'sinatra'

enable :sessions

get '/' do
  session[:page] = 'to-kick-or-not-to-kick' unless session[:page]
  erb "story/#{session[:page]}".to_sym
end

get '/play-again' do
  session.clear
  redirect to '/'
end

get '/:page' do
  session[:page] = params[:page]
  erb "story/#{session[:page]}".to_sym
  #   redirect to '/'
end
