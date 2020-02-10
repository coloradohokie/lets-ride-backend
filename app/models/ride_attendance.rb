class RideAttendance < ApplicationRecord
  belongs_to :rider
  belongs_to :ride
  belongs_to :motorcycle
end
