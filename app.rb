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

get '/:page' do
  session[:page] = params[:page]
  increment_deaths_if_dead

  # erb "story/#{session[:page]}".to_sym
  redirect to '/'
end

before do
  increment_deaths_if_dead
end

def increment_deaths_if_dead
  death_scenes = %w(sheep-death push-button sheep-transformation)
  session[:deaths] = 0 unless session[:deaths]
  if death_scenes.include? params[:page]
    session[:deaths] += 1
  end
end
