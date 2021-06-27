class FetchBook
  def initialize(books_gateway)
    @books_gateway = books_gateway
  end

  def invoke(id)
    @validation_errors = []
    convert_to_integer(id)
    validate(id)
    if @validation_errors.empty?
      @books_gateway.fetch_book(id)
    else
      @validation_errors
    end
  end

  private

  def validate(id)
    if id.to_s.empty?
      @validation_errors << 'invalid ID format: must be a number'
    end
  end

  def convert_to_integer(id)
    Integer(id || '')
  rescue ArgumentError
    nil
  end
end
