class QuoteBuilder

  def build
    service.quote.first
  end

  def service
    SwansonService.new("quote")
  end
end
