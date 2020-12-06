class BandMembership < ApplicationRecord
  belongs_to :band
  belongs_to :artist
end
