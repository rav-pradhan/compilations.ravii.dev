class FetchBooks
  def initialize(books_gateway)
    @books_gateway = books_gateway
  end

  def invoke
    @books_gateway.fetch_all
  end
end
