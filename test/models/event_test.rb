require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "if event has not picture, it will use band's picture" do

    event = Event.first

    assert_nil event.image

    event.band.images.attach(io: File.open("#{Rails.root}/test/fixtures/files/band.jpg"), filename: 'band.jpg',
                             content_type: 'image/jpg')

    assert event.image == event.band.images[0]

    event.images.attach(io: File.open("#{Rails.root}/test/fixtures/files/event.jpg"), filename: 'event.jpg',
                             content_type: 'image/jpg')
    assert event.image == event.images[0]

  end
end
