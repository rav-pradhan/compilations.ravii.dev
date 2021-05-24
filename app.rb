require 'sinatra/base'
require 'sequel'
require 'pg'
require 'dotenv/load'

require_relative 'lib/gateway/books_gateway_sequel'
require_relative 'lib/use_cases/fetch_books'
require_relative 'lib/use_cases/fetch_book'

class App < Sinatra::Base
  before do
    @database = Sequel.connect(
      "postgres://#{ENV['USERNAME']}:#{ENV['PASSWORD']}@#{ENV['HOST']}:#{ENV['PORT']}/#{ENV['DB']}"
    )
  end

  get '/' do
    @page_heading = 'Compilations'
    @media = []
    erb :home, layout: :'layouts/main'
  end

  get '/books' do
    gateway = BooksGatewaySequel.new(@database)
    @books = FetchBooks.new(gateway).invoke
    @page_heading = 'All Books'
    erb :books, layout: :'layouts/media'
  end

  get '/books/:id' do
    gateway = BooksGatewaySequel.new(@database)
    @book = FetchBook.new(gateway).invoke(params[:id])
    @page_heading = @book[:title]
    erb :book, layout: :'layouts/main'
  end

  not_found do
    status 404
    erb :page_not_found, layout: :'layouts/main'
  end
end
