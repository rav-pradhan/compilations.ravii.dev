class FetchRecentAdditions

    def initialize(datastore)
        @datastore = datastore
    end

    def invoke
        @datastore.fetch_recent_additions
    end

end