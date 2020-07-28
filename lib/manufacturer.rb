class Manufacturer < ApplicationRecord
    has_many :vehicles, as: :drivable
end