require 'spec_helper'
require 'gateway/mock_books_gateway'

describe 'FetchBooks' do
  describe '#invoke' do
    context 'given that the use case is instantiated with a database' do
      let(:mock_books_gateway) { MockBooksGateway.new }
      let(:fetch_books) { FetchBooks.new(mock_books_gateway) }
      it 'makes a call to fetch books from the database' do
        fetch_books.invoke
        expect(mock_books_gateway.fetch_all_was_called?).to be_truthy
      end
    end
  end
end
