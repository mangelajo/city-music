class Genre < ApplicationRecord
  has_and_belongs_to_many :bands
  has_and_belongs_to_many :events
end
