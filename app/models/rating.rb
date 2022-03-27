class Rating < ApplicationRecord
  validates_presence_of :score

  belongs_to :quote
  belongs_to :user
end
