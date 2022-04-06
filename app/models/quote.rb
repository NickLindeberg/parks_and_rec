class Quote < ApplicationRecord
  validates_presence_of :thought

  has_many :ratings
end
