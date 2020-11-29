class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :band
  has_many_attached :images
end
