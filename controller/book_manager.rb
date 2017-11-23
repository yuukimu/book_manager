class BookManager < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :views => 'views'

  get '/' do
    @title = 'Book Manager'
    erb :'book_manager/welcome'
  end

  get '/welcome' do
    @title = 'welcome'
    erb :'book_manager/welcome'
  end

end