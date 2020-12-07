class Venue < ApplicationRecord
  belongs_to :city
  has_many :events, :dependent => :destroy
  has_many_attached :images

  scope :filter_by_name, -> (name) { where name: name}
  scope :filter_by_city, -> (name) {
    city = City.where('lower(name) = ?', name.downcase).first || City.new
    where city_id: city.id
  }

end
