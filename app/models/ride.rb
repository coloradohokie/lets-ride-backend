class Ride < ApplicationRecord
  belongs_to :route
  has_many :ride_attendances
  has_many :riders, through: :ride_attendances
end
