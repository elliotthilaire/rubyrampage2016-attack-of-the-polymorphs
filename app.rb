require 'sinatra'

enable :sessions

get '/' do
  session[:page] = 'to-kick-or-not-to-kick' unless session[:page]
  erb "story/#{session[:page]}".to_sym
end

get '/play-again' do
  session[:page] = nil
  redirect to '/'
end

get '/reset' do
  session.clear
  redirect to '/'
end

get '/:page' do
  if File.exist?("views/story/#{params[:page]}.erb")
    session[:page] = params[:page]
    redirect to '/'
  else
    halt 404
  end
end

not_found do
  increment_deaths
  erb :'404'
end

error do
  increment_deaths
  erb :'500'
end

before do
  increment_deaths if dead?
end

def increment_deaths
  session[:deaths] = 0 unless session[:deaths]
  session[:deaths] += 1
end

def dead?
  death_scenes = %w(sheep-death push-button sheep-transformation)
  death_scenes.include? params[:page]
end
