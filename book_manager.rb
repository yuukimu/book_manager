require "sinatra/base"
require "sinatra/reloader"

class BookManager < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello, nginx and unicorn!'
  end

  get '/search/:keyword' do |k|
    @title = 'search'
    @login = false
    @keyword = k
    erb :search
  end

end