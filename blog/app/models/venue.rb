class Venue < ApplicationRecord
  belongs_to :city
  has_many :events
end
