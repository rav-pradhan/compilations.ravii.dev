class BooksGatewaySequel
  def initialize(database)
    @database = database
    @books = @database[:compilations_books]
  end

  def fetch_all
    @books
  end

  def fetch_book(book_id)
    @books.first(:id => book_id)
  end
end
