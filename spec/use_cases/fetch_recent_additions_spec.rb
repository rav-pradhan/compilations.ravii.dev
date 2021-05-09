require 'spec_helper'

describe 'FetchRecentAdditions' do
    describe '#invoke' do
        context 'given when the use case is instantiated with a datastore' do
            let(:datastore) { MockDatastore.new }
            let(:fetch_additions) { FetchRecentAdditions.new(datastore) }
            it 'makes a call to the datastore\'s fetch_recent_additions' do
                fetch_additions.invoke()
                expect(datastore.fetch_recent_additions_was_called?).to be_truthy
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