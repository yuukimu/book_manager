require 'open-uri'

class Register < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :views => 'views'
  
  get '/register\/?' do
    @title = '本の登録'
    erb :'register/manual'
  end

  get '/register/:isbn' do |isbn|
    @title = '本の登録'
    OpenURI.open_uri("https://www.googleapis.com/books/v1/volumes?q=isbn:#{isbn}") { |io|
      @book_data = parse_json(io.read)
    }

    if !@book_data
      @message = '本の情報が見つかりませんでした。'
      erb :'register/manual'
    else
      erb :'register/search'
    end
  end

  def parse_json(json)
    result = JSON.parse(json);
    if result['totalItems'].to_i == 0
      return false
    end
    data = Hash.new('')
    volumeInfo = result['items'][0]['volumeInfo']
    data['title'] = volumeInfo['title'].to_s
    data['author'] = volumeInfo['authors'].map! { |e| e.to_s }.join(",")
    data['image'] = volumeInfo['imageLinks']['thumbnail'].to_s
    puts data
    return data
  end

  private :parse_json

end