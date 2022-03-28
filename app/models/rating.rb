class Rating < ApplicationRecord
  validates_presence_of :score

  belongs_to :quote
  belongs_to :user

  def self.already_rated_by_user(user)
    where(user_id: user.id).any?
  end

  def self.average_score
    all.count.positive? ? all.map { |r| r.score }.sum / count : "No Ratings Yet"
  end
end
