#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra/base'
require 'slim'
require 'sass'
require 'coffee-script'

class SassHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/assets/sass'

  get 'public/assets/css/*.css' do
    filename = params[:splat].first
    sass filename.to_sym
  end
end

class CoffeeHandler < Sinatra::Base
  set :views, File.dirname(__FILE__) + '/assets/coffee'

  get "public/assets/js/*.js" do
    filename = params[:splat].first
    coffee filename.to_sym
  end
end

class Jovan < Sinatra::Base
  use SassHandler
  use CoffeeHandler

  set :views, File.dirname(__FILE__) + '/views'

  get '/' do
    slim :index
  end

  get '/menus' do
    slim :menus
  end

  get '/recipes' do
    slim :recipes
  end

  get '/gallery' do
    slim :gallery
  end

  get '/farms' do
    slim :farms
  end
end

if __FILE__ == $0
  Jovan.run! :port => ENV['PORT']
end
