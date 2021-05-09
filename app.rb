require 'sinatra/base'
require 'sprockets'
require 'uglifier'
require 'sassc'
require 'sass'

class App < Sinatra::Base
  get '/' do
    @page_heading = 'Compilations'
    @media = []
    erb :home, layout: :'layouts/main'
  end

  get '/books' do
    @page_heading = 'Books'
    erb :books, layout: :'layouts/media'
  end

  get '/:type/:id' do
      erb :item, layout: :'layouts/main'
  end
end
