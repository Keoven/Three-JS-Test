#! /usr/bin/env ruby

require 'sinatra'
require 'sass'
require 'haml'
require 'coffee_script'

set :port, 3000

get '/' do
  haml :index, :format => :html5
end

get '/javascripts/index.js' do
  content_type 'text/javascript'
  coffee :index
end

get '/stylesheets/base.css' do
  content_type 'text/css'
  scss :base
end
