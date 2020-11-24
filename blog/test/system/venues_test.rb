require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  setup do
    @venue = venues(:one)
  end

  test "visiting the index" do
    visit venues_url
    assert_selector "h1", text: "Venues"
  end

  test "creating a Venue" do
    visit venues_url
    click_on "New Venue"

    fill_in "Capacity", with: @venue.capacity
    fill_in "City", with: @venue.city_id
    fill_in "Description", with: @venue.description
    fill_in "Name", with: @venue.name
    fill_in "Phone", with: @venue.phone
    fill_in "Postalcode", with: @venue.postalCode
    fill_in "Rating", with: @venue.rating
    fill_in "Street", with: @venue.street
    fill_in "Website", with: @venue.website
    click_on "Create Venue"

    assert_text "Venue was successfully created"
    click_on "Back"
  end

  test "updating a Venue" do
    visit venues_url
    click_on "Edit", match: :first

    fill_in "Capacity", with: @venue.capacity
    fill_in "City", with: @venue.city_id
    fill_in "Description", with: @venue.description
    fill_in "Name", with: @venue.name
    fill_in "Phone", with: @venue.phone
    fill_in "Postalcode", with: @venue.postalCode
    fill_in "Rating", with: @venue.rating
    fill_in "Street", with: @venue.street
    fill_in "Website", with: @venue.website
    click_on "Update Venue"

    assert_text "Venue was successfully updated"
    click_on "Back"
  end

  test "destroying a Venue" do
    visit venues_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Venue was successfully destroyed"
  end
end
