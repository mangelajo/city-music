class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :band
  has_many_attached :images
  has_many :event_dates, :dependent => :destroy

  has_and_belongs_to_many :genres

  def image
    if images.attached?
      return images[0]
    elsif band.images.attached?
      return band.images[0]
    end
  end
end
