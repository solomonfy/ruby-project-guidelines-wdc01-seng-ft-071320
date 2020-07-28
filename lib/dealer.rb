class Dealer < ApplicationRecord
    has_many :vehicles, as: :drivable
end