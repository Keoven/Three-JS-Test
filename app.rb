#! /usr/bin/env ruby

require 'sinatra'
require 'sass'
require 'haml'

set :port, 3000

get '/' do
  haml :index, :format => :html5
end

get '/stylesheets/base.css' do
  content_type 'text/css'
  scss :base
end
