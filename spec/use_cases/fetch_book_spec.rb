require 'spec_helper'
require 'gateway/mock_books_gateway'

describe 'FetchBook' do
  describe '#invoke' do
    context 'given that the visitor requests a book and its details' do
      let(:mock_books_gateway) { MockBooksGateway.new }
      let(:fetch_book) { FetchBook.new(mock_books_gateway) }
      it 'then fetches the book based on its ID from the database' do
        fetch_book.invoke(1)
        expect(mock_books_gateway.fetch_book_was_called?).to be_truthy
      end
    end

    context 'given that the visitor requests a book but with an empty ID' do
      let(:mock_books_gateway) { MockBooksGateway.new }
      let(:fetch_book) { FetchBook.new(mock_books_gateway) }
      it 'then returns an error message stating the book ID format required' do
        expect(fetch_book.invoke('')).to eq(
          ['invalid ID format: must be a number']
        )
      end
    end
  end
end
