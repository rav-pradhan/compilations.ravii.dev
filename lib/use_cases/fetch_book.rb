class FetchBook
    def initialize(books_gateway)
      @books_gateway = books_gateway
    end
  
    def invoke(id)
      @validation_errors = []
      convert_to_integer(id)
      validate(id)
      return @books_gateway.fetch_book(id) if @validation_errors.empty?
      @validation_errors
    end

    private

    def validate(id)
        @validation_errors << "invalid ID format: must be a number" if id.to_s.empty?
    end

    def convert_to_integer(id)
      Integer(id || '')
    rescue ArgumentError
      nil
    end
  end
  