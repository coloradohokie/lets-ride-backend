class User < ApplicationRecord
    has_secure_password
    mount_uploader :avatar, AvatarUploader
    has_many :motorcycles
    has_many :ride_attendances
    has_many :rides, through: :ride_attendances
end
