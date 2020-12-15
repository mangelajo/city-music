require 'rails_helper'

RSpec.describe "Events", type: :request do
  let(:madrid) {City.create!(name:"Madrid")}
  let!(:venue1) {Venue.create!(name:"venue1", city: madrid)}
  let!(:venue2) {Venue.create!(name:"venue2", city: madrid)}
  let!(:admin) {User.create!(email:'admin@email.com', password:'123456', administrator:true)}
  let!(:band) {Band.create!(name:'the band')}
  let!(:event1) {Event.create!(name:"Unforgettable event", venue: venue1, band: band)}
  let!(:event2) {Event.create!(name:"Event to forget", venue: venue2, band:band)}

  it "should list all events in json" do
    sign_in admin
    get "/events.json"
    parsed_body = JSON.parse(response.body)
    expect(parsed_body.length).to be(2)

    Event.create!(name:"Another event", venue: venue1, band:band)
    get "/events.json"
    parsed_body = JSON.parse(response.body)
    expect(parsed_body.length).to be(3)
  end

  it "should list events by venue_id" do
      sign_in admin
      get "/events.json?venue_id="+venue1.id.to_s
      parsed_body = JSON.parse(response.body)
      expect(parsed_body.length).to be(1)
      expect(parsed_body[0]['id']).to be(event1.id)
  end

  it "should list events by name" do
    sign_in admin
    get "/events.json?name=" + event2.name
    parsed_body = JSON.parse(response.body)
    expect(parsed_body.length).to be(1)
    expect(parsed_body[0]['id']).to be(event2.id)
  end

  it "should create events without event_dates from json" do
    sign_in admin
    params = {name: "A new event", venue_id: venue1.id, band_id: band.id}
    post "/events.json", :params => params, as: :json
    get "/events.json"
    parsed_body = JSON.parse(response.body)
    expect(parsed_body.length).to be(3)
  end

  it "should create events with event_dates from json" do
    sign_in admin
    params = {name: "A new event", venue_id: venue1.id, band_id: band.id, event_dates: [
        {date: "10/10/2013 13:00"}, {date: "11/10/2020 15:00"}
    ]}
    post "/events.json", :params => params, as: :json
    get "/events.json"

    event = Event.find_by(name:"A new event")
    expect(event).not_to be_nil
    expect(event.event_dates.length).to be(2)

  end

  it "should create events without band from json" do
    sign_in admin
    params = {name: "A new event", venue_id: venue1.id}
    post "/events.json", :params => params, as: :json
    get "/events.json"
    parsed_body = JSON.parse(response.body)
    expect(parsed_body.length).to be(3)
  end

end
