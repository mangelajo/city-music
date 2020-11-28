class Band < ApplicationRecord
  has_many :band_memberships
  has_many :events
  has_many :artists, through: :band_memberships

  rails_admin do
    configure :band_memberships do
      hide
    end
  end
end
