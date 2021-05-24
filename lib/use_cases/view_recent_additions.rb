class ViewRecentAdditions
  def initialize(compilations_gateway)
    @compilations_gateway = compilations_gateway
  end

  def invoke
    @compilations_gateway.fetch_recent_additions
  end
end
