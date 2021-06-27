class MockBooksGateway
  @fetch_book_called = false
  @fetch__all_was_called = false

  def fetch_book(id)
    @fetch_book_called = true
  end

  def fetch_book_was_called?
    @fetch_book_called
  end

  def fetch_all
    @fetch_called = true
  end

  def fetch_all_was_called?
    @fetch_called
  end
end
