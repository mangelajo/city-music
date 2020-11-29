class Venue < ApplicationRecord
  belongs_to :city
  has_many :events

  has_many_attached :images
end
