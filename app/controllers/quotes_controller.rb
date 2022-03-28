class QuotesController < ApplicationController
  before_action :set_user

  def index
    @thought = QuoteBuilder.new.build
    @quote = Quote.find_or_create_by(thought: @thought)
    @ratings = @quote.ratings
  end

  private

  def user_ip
    request.remote_ip
  end

  def set_user
    @user = User.find_or_create_by(ip_address: request.remote_ip)
  end
end
