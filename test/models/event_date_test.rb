require 'test_helper'

class EventDateTest < ActiveSupport::TestCase
  test "month_s method returns 3 letter upcase month" do
    assert event_dates(:one).month_s == "DEC"
    assert event_dates(:two).month_s == "JAN"
  end
end
