require "application_system_test_case"

class EventsTest < ApplicationSystemTestCase
  setup do
    @event = events(:one)
  end

  test "visiting the index" do
    visit events_url
    assert_selector "h1", text: "Events"
  end

  test "creating a Event" do
    visit events_url
    click_on "New Event"

    fill_in "Description", with: @event.description
    fill_in "Name", with: @event.name
    fill_in "Price max", with: @event.price_max
    fill_in "Price min", with: @event.price_min
    fill_in "Source url", with: @event.source_url
    fill_in "Tickets urls", with: @event.tickets_urls
    fill_in "Venue", with: @event.venue_id
    fill_in "Video url", with: @event.video_url
    click_on "Create Event"

    assert_text "Event was successfully created"
    click_on "Back"
  end

  test "updating a Event" do
    visit events_url
    click_on "Edit", match: :first

    fill_in "Description", with: @event.description
    fill_in "Name", with: @event.name
    fill_in "Price max", with: @event.price_max
    fill_in "Price min", with: @event.price_min
    fill_in "Source url", with: @event.source_url
    fill_in "Tickets urls", with: @event.tickets_urls
    fill_in "Venue", with: @event.venue_id
    fill_in "Video url", with: @event.video_url
    click_on "Update Event"

    assert_text "Event was successfully updated"
    click_on "Back"
  end

  test "destroying a Event" do
    visit events_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event was successfully destroyed"
  end
end
