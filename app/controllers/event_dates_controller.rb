class EventDatesController < ApplicationController
  def index
    authorize! :manage, :venue if api_request?
    @event_dates = EventDate.all.order(:date)
  end
end
