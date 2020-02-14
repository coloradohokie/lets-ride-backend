class Rider < ApplicationRecord
    has_many :motorcycle
    has_many :ride_attendances, through: :motorcycle
end
