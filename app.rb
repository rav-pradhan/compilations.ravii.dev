require 'sinatra/base'
require 'sequel'
require 'pg'
require 'dotenv/load'

require_relative 'lib/gateway/books_gateway_sequel'
require_relative 'lib/use_cases/fetch_books'
require_relative 'lib/use_cases/fetch_book'

class App < Sinatra::Base
  before do
    cache_control :public, :max_age => 31536000
    @database = Sequel.connect("#{ENV['DATABASE_URL']}")
    @database.extension :pg_array
  end

  after do
    @database.disconnect
  end

  get '/' do
    @page_heading = 'Welcome'
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
    @content = "It looks like this page doesn't exist! If clicking on a link brought you here, then whoops. I should probably check that out."
    erb :page_not_loaded, layout: :'layouts/main'
  end

  error do
    @page_heading = "Error"
    @content = "Sorry, something untoward happened when trying to load the page. Try refreshing the page."
    erb :page_not_loaded, layout: :'layouts/main' 
  end
end
