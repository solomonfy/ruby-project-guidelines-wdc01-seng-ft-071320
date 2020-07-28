class Buyer < ApplicationRecord
    has_many :vehicles, as: :drivable
end