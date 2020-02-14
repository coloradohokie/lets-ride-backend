class Motorcycle < ApplicationRecord
  belongs_to :rider
  has_many :ride_attendances
end
