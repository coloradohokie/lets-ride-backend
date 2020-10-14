class Ride < ApplicationRecord
  belongs_to :route
  has_many :ride_attendances
  has_many :users, through: :ride_attendances
end
