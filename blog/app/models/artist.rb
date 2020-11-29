class Artist < ApplicationRecord
  has_many :band_memberships
  has_many :bands, through: :band_memberships

  has_many_attached :images

  rails_admin do
    configure :band_memberships do
      hide
    end
  end
end
