class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :band
  has_many_attached :images

  has_and_belongs_to_many :genres
end
