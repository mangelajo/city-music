class EventDate < ApplicationRecord
  belongs_to :event

  def to_s
    date.to_s
  end
end
