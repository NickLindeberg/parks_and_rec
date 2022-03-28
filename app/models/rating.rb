class Rating < ApplicationRecord
  validates_presence_of :score

  belongs_to :quote
  belongs_to :user

  def self.average_score
    all.count.positive? ? all.map { |r| r.score }.sum / count : "No Ratings Yet"
  end
end
