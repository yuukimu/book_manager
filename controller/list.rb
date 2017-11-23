class List < Sinatra::Base
  set :views => 'views'
  get '/list' do
    erb :'list'
  end
end