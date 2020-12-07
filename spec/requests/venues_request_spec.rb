require 'rails_helper'

RSpec.describe "Venues", type: :request do
  let(:madrid) {City.create!(name:"Madrid")}
  let(:mostoles) {City.create!(name: "Móstoles")}
  let!(:venue1) {Venue.create!(name:"venue1", city: madrid)}
  let!(:venue2) {Venue.create!(name:"venue2", city: mostoles)}

  it "should list all venues" do
    get "/venues"
    expect(response.body).to include(venue1.name)
    expect(response.body).to include(venue2.name)
  end

  it "should filter venues by name" do
    get "/venues", params: {name: venue1.name}
    expect(response.body).to include(venue1.name)
    expect(response.body).not_to include(venue2.name)
  end

  it "should filter venues by city" do
    get "/venues", params: {city: venue1.city.name}
    expect(response.body).to include(venue1.name)
    expect(response.body).not_to include(venue2.name)
  end

end
