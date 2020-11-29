class Band < ApplicationRecord
  has_many :band_memberships
  has_many :events
  has_many :artists, through: :band_memberships

  has_and_belongs_to_many :genres

  has_many_attached :images

  rails_admin do
    configure :band_memberships do
      hide
    end
  end
end
