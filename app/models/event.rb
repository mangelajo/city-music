require 'time'
require 'action_view'

class Event < ApplicationRecord
  include ActionView::Helpers::SanitizeHelper

  belongs_to :venue
  belongs_to :band, :optional => true
  has_many_attached :images
  has_many :event_dates, :dependent => :destroy

  has_and_belongs_to_many :genres

  scope :filter_by_name, -> (name) { where name: name}
  scope :filter_by_venue_id, -> (venue_id) { where venue_id: venue_id}
  scope :filter_by_source_url, -> (source_url) { where source_url: source_url}

  def short_description
    if description?
      strip_tags(description).truncate(300)
    else
      ""
    end
  end
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
    elsif band and band.images.attached?
      band.images[0]
    end
  end
end
