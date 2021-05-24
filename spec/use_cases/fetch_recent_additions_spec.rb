require 'spec_helper'

describe 'ViewRecentAdditions' do
  describe '#invoke' do
    context 'given that the use case is instantiated with a datastore' do
      let(:mock_compilations_gateway) { MockDatastore.new }
      let(:fetch_additions) do
        ViewRecentAdditions.new(mock_compilations_gateway)
      end
      it 'makes a call to the datastore\'s fetch_recent_additions' do
        fetch_additions.invoke
        expect(
          mock_compilations_gateway.fetch_recent_additions_was_called?
        ).to be_truthy
      end
    end
  end
end

class MockDatastore
  @fetch_recent_additions_called = false

  def fetch_recent_additions
    @fetch_recent_additions_called = true
  end

  def fetch_recent_additions_was_called?
    @fetch_recent_additions_called
  end
end
