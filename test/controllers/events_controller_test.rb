require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get events_url
    assert_response :success
  end

  test "should get new" do
    get new_event_url
    assert_response :success
  end

  test "should create event" do
    user = User.create!(administrator: true, email: 'test@user.es', password: '123456')
    sign_in user
    assert_difference('Event.count') do
      post events_url, params: {
          event: {
              description: @event.description,
              name: "New event",
              price_max: @event.price_max,
              price_min: @event.price_min,
              source_url: @event.source_url,
              tickets_urls: @event.tickets_urls,
              venue_id: @event.venue_id,
              video_url: @event.video_url,
              band_id: @event.band_id,
          }
      }

    end

    assert_redirected_to event_url(Event.last)
  end

  test "should show event" do
    get event_url(@event)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_url(@event)
    assert_response :success
  end

  test "should update event" do
    patch event_url(@event), params: { event: { description: @event.description, name: @event.name, price_max: @event.price_max, price_min: @event.price_min, source_url: @event.source_url, tickets_urls: @event.tickets_urls, venue_id: @event.venue_id, video_url: @event.video_url } }
    assert_redirected_to event_url(@event)
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end

    assert_redirected_to events_url
  end
end
