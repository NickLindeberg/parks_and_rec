class User < ApplicationRecord
  validates_presence_of :ip_address

  has_many :ratings
end
