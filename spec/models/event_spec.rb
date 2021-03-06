require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:band) {Band.create(name: "The band!")}
  let(:event) {Event.create(band: band)}
  context 'when attaching images' do

    it 'should return nil if no image attached' do
      expect(event.image).to be_nil
    end

    it 'should return the band image when event has no image' do
      event.band.images.attach(io: File.open("#{Rails.root}/test/fixtures/files/band.jpg"), filename: 'band.jpg',
                               content_type: 'image/jpg')
      expect(event.image).to equal(event.band.images[0])
    end

    it 'should return the event image if it has one'   do
      event.band.images.attach(io: File.open("#{Rails.root}/test/fixtures/files/band.jpg"), filename: 'band.jpg',
                               content_type: 'image/jpg')
      event.images.attach(io: File.open("#{Rails.root}/test/fixtures/files/event.jpg"), filename: 'event.jpg',
                               content_type: 'image/jpg')

      expect(event.image).to equal(event.images[0])
    end

    it 'should update the event dates' do
      event.update_dates(["10/10/2020 12:00"])
      expect(event.event_dates.length).to equal(1)

      event.update_dates(["10/10/2020 12:00"])
      expect(event.event_dates.length).to equal(1)

      event.update_dates(["10/10/2020 12:00","11/10/2020 12:00"])
      expect(event.event_dates.length).to equal(2)

      event.update_dates(["11/10/2020 12:00"])
      expect(event.event_dates.length).to equal(1)

      event.update_dates(["11/10/2020 12:00", "11/10/2020 12:00"])
      expect(event.event_dates.length).to equal(1)

    end
  end
end
