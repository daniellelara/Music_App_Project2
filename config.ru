require 'rubygems'
require 'bundler'
require "carrierwave"

Bundler.require

require File.expand_path('../config/environment', __FILE__)

run Sinatra::Application