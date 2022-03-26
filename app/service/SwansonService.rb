class SwansonService
  include HTTParty
  base_uri 'https://ron-swanson-quotes.herokuapp.com/v2/'

  def initialize(quote)
    @options = {query: quote}
  end

  def quote
    self.class.get('/quotes')
  end
end
