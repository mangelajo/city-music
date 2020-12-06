class Band < ApplicationRecord
  has_many :band_memberships, :dependent => :destroy
  has_many :events, :dependent => :nullify
  has_many :artists, through: :band_memberships

  has_and_belongs_to_many :genres

  has_many_attached :images

  rails_admin do
    configure :band_memberships do
      hide
    end
  end
end
