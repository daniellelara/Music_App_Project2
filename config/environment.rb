require "sinatra/reloader" if development?

# require flash
require 'sinatra/flash'
require_relative '../lib/sinatra-flash'
register Sinatra::Flash 

# Setup app to use SASS
require 'sass/plugin/rack'
Sass::Plugin.options[:style] = :compact
use Sass::Plugin::Rack

# Setup the asset pipeline
register Sinatra::AssetPack
assets do
  js :application, [
    '/bower_components/jquery/dist/jquery.min.js',
    '/js/pure.js',
    '/js/app.js'  ]
  css :application, [
    '/bower_components/pure/pure-min.css',
    '/stylesheets/style.css'
  ]
  js_compression  :jsmin    # :jsmin | :yui | :closure | :uglify
  css_compression :simple   # :simple | :sass | :yui | :sqwish
end

# Set the views directory
configure do
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || "this is a secret, shhhhh"
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Set up the models, controllers and helpers
Dir[APP_ROOT.join('app', 'models', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }