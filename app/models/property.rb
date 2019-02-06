class Property < ApplicationRecord
  has_one :unit_type
  has_many :amenities
end
