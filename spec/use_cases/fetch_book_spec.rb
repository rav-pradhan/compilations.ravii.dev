require 'spec_helper'

describe 'FetchBook' do
  describe '#invoke' do
    context 'given that the use case is invoked with a valid ID' do
      let(:mock_books_gateway) { MockBooksGateway.new }
      let(:fetch_book) { FetchBook.new(mock_books_gateway) }
      it 'makes a call to the datastore\'s fetch_book' do
        fetch_book.invoke(1)
        expect(mock_books_gateway.fetch_book_was_called?).to be_truthy
      end
    end

    context 'given that the use case is invoked with no ID' do
        let(:mock_books_gateway) { MockBooksGateway.new }
        let(:fetch_book) { FetchBook.new(mock_books_gateway) }
        it 'returns a validation error: invalid ID format' do
          expect(fetch_book.invoke("")).to eq(["invalid ID format: must be a number"])
        end
    end
  end
end

class MockBooksGateway
  @fetch_book_called = false

  def fetch_book(id)
    @fetch_book_called = true
  end

  def fetch_book_was_called?
    @fetch_book_called
  end
end
