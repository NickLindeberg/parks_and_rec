class RatingsController < ApplicationController
  before_action :set_quote, only: [:new, :create]
  before_action :user

  def new
    if @quote.ratings.any? { |r| r.user_id == @user.id }
      redirect_to quotes_path
    else
      @rating = @quote.ratings.new
    end
  end

  def create
    rating = @quote.ratings.create(rating_params)
    rating.user_id = @user.id
    rating.save

    redirect_to quotes_path
  end

  private

  def user
    @user = User.find_or_create_by(ip_address: request.remote_ip)
  end

  def rating_params
    params.require(:rating).permit(:score, user_id: user)
  end

  def set_quote
    @quote= Quote.find_by(id: params[:quote_id])
  end
end
