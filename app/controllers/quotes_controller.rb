class QuotesController < ApplicationController
  def index
    @quote = service.quote.first
    @ip = user_ip
  end

  private

  def user_ip
    request.remote_ip
  end

  def service
    SwansonService.new('quote')
  end
end
