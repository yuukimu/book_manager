class Add < Sinatra::Base
  set :views => 'views'
  
  get '/add' do
    "add"
  end
end