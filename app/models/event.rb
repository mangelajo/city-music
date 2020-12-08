require 'time'

class Event < ApplicationRecord
  belongs_to :venue
  belongs_to :band
  has_many_attached :images
  has_many :event_dates, :dependent => :destroy

  has_and_belongs_to_many :genres

  def add_dates(dates)
    if dates
      dates.each do |date|
        event_dates << EventDate.new(date: date[:date])
      end
    end
  end

  def update_dates(wanted_dates)
    wanted_dates = [] if wanted_dates == nil
    wanted_dates = wanted_dates.map {|d| Time.parse(d)}
    event_dates.each do |date|
      if not wanted_dates.include? date.date
        event_dates.delete(date)
      end
    end
    current_dates = event_dates.map{|ed| ed.date}
    wanted_dates.each do |date|
      if not current_dates.include? date
        event_dates << EventDate.new(date: date)
        current_dates << date
      end
    end

    true
  end

  def image
    if images.attached?
      images[0]
    elsif band.images.attached?
      band.images[0]
    end
  end
end
