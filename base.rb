require "sinatra/base"
require "sinatra/reloader"
require_relative "controller/book_manager.rb"
require_relative "controller/add.rb"
require_relative "controller/register.rb"

class Base < Sinatra::Base
  use BookManager
  use Register
  use Add
end