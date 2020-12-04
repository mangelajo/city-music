class Venue < ApplicationRecord
  belongs_to :city
  has_many :events, :dependent => :destroy

  has_many_attached :images
end
