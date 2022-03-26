class QuotesController < ApplicationController

  def index
    @quote = service.quote.first
  end

  private

  def service
    SwansonService.new('quote')
  end
end
